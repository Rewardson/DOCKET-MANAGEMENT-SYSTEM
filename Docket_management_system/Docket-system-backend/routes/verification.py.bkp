from flask import Blueprint, jsonify, request
import mysql.connector
import os
import hashlib
from dotenv import load_dotenv
from utils.auth import jwt_required
from routes.dockets import read_json_file, BLOCKLIST_FILE

# Load environment variables
load_dotenv()

# Blueprint for verification routes
verification_bp = Blueprint("verification", __name__)

# Database connection helper
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "docket_system"),
    )

@verification_bp.route("/verify", methods=["POST"])
@jwt_required(role="admin")
def verify_docket():
    data = request.json
    qr_data = data.get("qr_data")
    print(f"Received QR data: {qr_data}")
    admin_id = request.user['sub'] # Get admin ID from JWT

    if not qr_data:
        return jsonify({"ok": False, "error": "Missing QR code data."}), 400

    conn = None
    try:
        # --- 1. Parse QR Code Data ---
        parts = qr_data.split('|')
        if len(parts) != 3:
            raise ValueError("Invalid QR data format")
        student_number, exam_type, token_value = parts

        # --- Check if student is blocked ---
        blocklist = read_json_file(BLOCKLIST_FILE)
        if student_number in blocklist:
            raise ValueError("Student is blocked. Please refer to the Retentions Office.")

        # --- 2. Connect to DB and Hash Token ---
        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)
        token_hash = hashlib.sha256(token_value.encode()).hexdigest()


        # --- 3. Find Active Token and Lock Row ---
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

        # --- 4. Handle Verification Logic ---
        if not token_row:
            # If no active token, it's invalid or already used. Simply return an error.
            # Do not attempt to log this, as we don't have a valid docket_id, which would cause an IntegrityError.
            conn.rollback() # End the transaction
            cur.close()
            conn.close()
            return jsonify({"ok": False, "error": "Docket is invalid, has already been used, or does not exist."}), 404

        # --- 5. If Valid: Update Token, Log Verification, and Fetch Details ---
        docket_id = token_row["docket_id"]

        # Update token status to 'used'
        cur.execute("UPDATE docket_tokens SET status = 'used', used_at = NOW() WHERE token_id = %s", (token_row["token_id"],))

        # Log the successful verification
        cur.execute("""
            INSERT INTO verifications (docket_id, scanned_by, scan_result, remarks)
            VALUES (%s, %s, %s, %s)
        """, (docket_id, admin_id, 'valid', 'Docket successfully verified'))

        # Fetch student details for visual confirmation
        cur.execute("""
            SELECT s.first_name, s.last_name, s.student_number, p.programme_name
            FROM students s
            JOIN programmes p ON s.programme_id = p.programme_id
            WHERE s.id = %s
        """, (token_row["student_id"],))
        student_details = cur.fetchone()

        # --- 6. Commit and Respond ---
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