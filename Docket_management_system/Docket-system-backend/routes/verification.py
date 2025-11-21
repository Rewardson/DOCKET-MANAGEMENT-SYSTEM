from flask import Blueprint, jsonify, request
import mysql.connector
import os
import hashlib
from dotenv import load_dotenv
from utils.auth import jwt_required
from routes.dockets import read_json_file, BLOCKLIST_FILE # Reusing helper functions from dockets blueprint

# Load environment variables from .env file
load_dotenv()

# Blueprint for verification routes
verification_bp = Blueprint("verification", __name__)

# Helper function to establish a database connection.
# This function is duplicated from app.py/dockets.py for modularity within the blueprint.
def get_db_connection():
    db_platform = os.getenv("DB_PLATFORM")

    if db_platform == 'XAMPP':
        # Configuration for local XAMPP (MariaDB) without SSL
        return mysql.connector.connect(
            host=os.getenv("DB_HOST", "localhost"),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASSWORD", ""),
            database=os.getenv("DB_NAME", "docket_system2"),
            autocommit=False,
            ssl_disabled=True
        )
    else:
        # Default configuration for TiDB with SSL
        return mysql.connector.connect(
            host=os.getenv("HOST"),
            user=os.getenv("USERNAME"),
            password=os.getenv("PASSWORD"),
            database=os.getenv("DATABASE"),
            autocommit=False,
            ssl_ca=os.getenv("CA"),
            ssl_verify_cert=False
        )

@verification_bp.route("/verify", methods=["POST"])
@jwt_required(role="admin")
def verify_docket():
    # Verifies a student's exam docket using QR code data.
    # It checks for validity, blocklist status, and logs the verification.
    data = request.json
    qr_data = data.get("qr_data")
    print(f"Received QR data: {qr_data}") # For debugging purposes
    admin_id = request.user['sub'] # Get admin ID from JWT payload

    if not qr_data:
        return jsonify({"ok": False, "error": "Missing QR code data."}), 400

    conn = None
    try:
        # Parse QR Code Data into student number, exam type, and token value.
        parts = qr_data.split('|')
        if len(parts) != 3:
            raise ValueError("Invalid QR data format")
        student_number, exam_type, token_value = parts

        # Check if the student is on the blocklist.
        blocklist = read_json_file(BLOCKLIST_FILE)
        if student_number in blocklist:
            raise ValueError("Student is blocked. Please refer to the Retentions Office.")

        # Connect to DB and hash the token for secure comparison.
        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)
        token_hash = hashlib.sha256(token_value.encode()).hexdigest()

        # Find an active token in the database and lock the row to prevent race conditions.
        conn.start_transaction()
        cur.execute("""
            SELECT dt.token_id, dt.docket_id, d.student_id
            FROM docket_tokens dt
            JOIN dockets d ON dt.docket_id = d.docket_id
            JOIN students s ON d.student_id = s.id
            WHERE dt.token_hash = %s
            AND s.student_number = %s
            AND d.exam_type = %s
            AND dt.status = 'active'
            LIMIT 1 FOR UPDATE
        """, (token_hash, student_number, exam_type))
        token_row = cur.fetchone()

        # Handle verification logic: if no active token, it's invalid or already used.
        if not token_row:
            conn.rollback() # End the transaction
            cur.close()
            conn.close()
            return jsonify({"ok": False, "error": "Docket is invalid, has already been used, or does not exist."}), 404

        # If valid: Update token status, log verification, and fetch student details.
        docket_id = token_row["docket_id"]

        # Mark the token as 'used'.
        cur.execute("UPDATE docket_tokens SET status = 'used', used_at = NOW() WHERE token_id = %s", (token_row["token_id"],))

        # Log the successful verification event.
        cur.execute("""
            INSERT INTO verifications (docket_id, scanned_by, scan_result, remarks)
            VALUES (%s, %s, %s, %s)
        """, (docket_id, admin_id, 'valid', 'Docket successfully verified'))

        # Fetch student details for display on the verification screen.
        cur.execute("""
            SELECT s.first_name, s.last_name, s.student_number, p.programme_name
            FROM students s
            JOIN programmes p ON s.programme_id = p.programme_id
            WHERE s.id = %s
        """, (token_row["student_id"],))
        student_details = cur.fetchone()

        # Commit the transaction and respond with success.
        conn.commit()
        cur.close()
        conn.close()

        return jsonify({
            "ok": True,
            "student": student_details,
            "exam_type": exam_type
        })

    except mysql.connector.Error as err:
        if conn:
            conn.rollback()
        print(f"Database error: {err}") # Added for debugging
        return jsonify({"ok": False, "error": "A database error occurred."}), 500
    except ValueError as e:
        if conn:
            conn.rollback()
        return jsonify({"ok": False, "error": str(e)}), 400
    except Exception as e:
        if conn:
            conn.rollback()
        return jsonify({"ok": False, "error": f"An unexpected error occurred: {e}"}), 500
    finally:
        if conn and conn.is_connected():
            cur.close()
            conn.close()

@verification_bp.route("/sync", methods=["POST"])
@jwt_required(role="admin")
def sync_verifications():
    # Synchronizes offline verification records with the database.
    # It processes a list of pending verifications, updates token statuses, and logs them.
    data = request.json
    pending = data.get("pending_verifications", [])
    admin_id = request.user['sub']

    if not pending:
        return jsonify({"ok": True, "message": "No items to sync."})

    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)
    try:
        conn.start_transaction()
        for item in pending:
            qr_data = item.get("qr_data")
            if not qr_data:
                continue

            parts = qr_data.split('|')
            if len(parts) != 3:
                continue
            student_number, exam_type, token_value = parts

            token_hash = hashlib.sha256(token_value.encode()).hexdigest()

            cur.execute("""
                SELECT dt.token_id, dt.docket_id
                FROM docket_tokens dt
                JOIN dockets d ON dt.docket_id = d.docket_id
                JOIN students s ON d.student_id = s.id
                WHERE dt.token_hash = %s AND s.student_number = %s AND d.exam_type = %s AND dt.status = 'active'
                LIMIT 1 FOR UPDATE
            """, (token_hash, student_number, exam_type))
            token_row = cur.fetchone()

            if token_row:
                cur.execute("UPDATE docket_tokens SET status = 'used', used_at = NOW() WHERE token_id = %s", (token_row["token_id"],))
                cur.execute("""
                    INSERT INTO verifications (docket_id, scanned_by, scan_result, remarks)
                    VALUES (%s, %s, %s, %s)
                """, (token_row["docket_id"], admin_id, 'valid', 'Synced from offline verification'))

        conn.commit()
        return jsonify({"ok": True, "message": "Sync successful"})

    except mysql.connector.Error as err:
        if conn:
            conn.rollback()
        return jsonify({"ok": False, "error": "Database error during sync."}), 500
    except Exception as e:
        if conn:
            conn.rollback()
        return jsonify({"ok": False, "error": f"An unexpected error occurred during sync: {e}"}), 500
    finally:
        if conn and conn.is_connected():
            cur.close()
            conn.close()