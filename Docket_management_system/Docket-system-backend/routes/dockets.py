from flask import Blueprint, jsonify, request, send_file
import os
from datetime import datetime
from io import BytesIO
import qrcode
import mysql.connector
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import Paragraph, Table, TableStyle
from reportlab.lib import colors
from reportlab.lib.units import inch
from dotenv import load_dotenv
import hashlib
import secrets
from utils.auth import jwt_required
import json # Import json for reading settings and blocklist files


# Load environment variables from .env file
load_dotenv()

# Blueprint for docket-related routes
dockets_bp = Blueprint("dockets", __name__)

# Define file paths for exam settings and student blocklist JSON files
backend_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(os.path.dirname(backend_dir))
SETTINGS_FILE = os.path.join(project_root, 'Docket-system-backend', 'exam_settings.json')
BLOCKLIST_FILE = os.path.join(project_root, 'Docket-system-backend', 'blocked_students.json')

# Helper function to read JSON data from a specified file
def read_json_file(file_path):
    try:
        with open(file_path, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        # Return default settings or an empty list if file is missing or corrupt
        if 'settings' in file_path:
            return {"active_exam": "cat1"}
        else:
            return []

# Helper function to establish a database connection
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

# Helper function to generate a PDF exam docket with student information, courses, and a QR code.
def generate_docket_pdf(student, courses, exam_type, qr_data):
    buffer = BytesIO()
    p = canvas.Canvas(buffer, pagesize=A4)
    width, height = A4

    # Styles for PDF content
    styles = getSampleStyleSheet()
    style_normal = styles['Normal']
    style_normal.fontName = 'Helvetica'
    style_normal.fontSize = 10
    style_bold_header = styles['h6']
    style_bold_header.fontName = 'Helvetica-Bold'

    # Start drawing from the top of the page
    y_pos = height - inch

    # Draw header elements including university logo, name, and exam type
    logo_path = os.path.join(os.getcwd(), "Docket-system-frontend", "frontend", "cavendish-logo.png")
    if os.path.exists(logo_path):
        p.drawImage(logo_path, inch - 0.5*inch, y_pos - 0.4*inch, width=1*inch, height=0.5*inch, preserveAspectRatio=True)
    
    p.setFont("Helvetica-Bold", 14)
    p.drawCentredString(width / 2, y_pos - 0.5 * inch, "Cavendish University Zambia Ltd.")
    y_pos -= 0.8 * inch
    p.setFont("Helvetica-Bold", 12)
    p.drawCentredString(width / 2, y_pos, student.get('faculty', 'Faculty of Business and Information Technology'))
    y_pos -= 0.2 * inch
    p.drawCentredString(width / 2, y_pos, student.get('programme_name', 'Bachelor of Science in Computing'))
    y_pos -= 0.4 * inch
    p.setFont("Helvetica-Bold", 16)
    p.drawCentredString(width / 2, y_pos, f"{exam_type.upper()} DOCKET")
    y_pos -= 0.2 * inch
    p.line(inch, y_pos, width - inch, y_pos)
    y_pos -= 0.3 * inch # Margin below line

    # Draw student information table
    info_data = [
        [Paragraph('<b>Date Issued:</b>', style_normal), Paragraph(datetime.now().strftime('%d/%m/%Y'), style_normal)],
        [Paragraph('<b>Student Name:</b>', style_normal), Paragraph(f"{student.get('first_name', '')} {student.get('last_name', '')}", style_normal)],
        [Paragraph('<b>Student Number:</b>', style_normal), Paragraph(student.get('student_number', ''), style_normal)],
    ]
    info_table = Table(info_data, colWidths=[1.5 * inch, 4.5 * inch])
    info_table.setStyle(TableStyle([
        ('ALIGN', (0, 0), (0, -1), 'LEFT'),
        ('ALIGN', (1, 0), (1, -1), 'LEFT'),
        ('VALIGN', (0, 0), (-1, -1), 'TOP'),
        ('LEFTPADDING', (0, 0), (-1, -1), 0),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 2),
        ('GRID', (0,0), (-1,-1), 1, colors.white) # Invisible grid to force rendering
    ]))
    
    info_table_height = info_table.wrap(width - 2 * inch, 0)[1]
    info_table.drawOn(p, inch, y_pos - info_table_height)
    y_pos -= (info_table_height + 0.4 * inch) # Subtract height and add margin

    # Draw main courses table
    header = [Paragraph(h, style_bold_header) for h in ['Code', 'Module', 'Date', 'Time', 'Venue', "INVIGILATOR'S SIGNATURE"]]
    table_data = [header]
    for course in courses:
        table_data.append([Paragraph(c, style_normal) for c in [course.get('course_code', ''), course.get('course_name', ''), '', '', '', '']])

    main_table = Table(table_data, colWidths=[0.7*inch, 2.4*inch, 0.6*inch, 0.6*inch, 0.6*inch, 1.4*inch])
    main_table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.lightgrey),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
        ('GRID', (0, 0), (-1, -1), 1, colors.black)
    ]))
    
    main_table_height = main_table.wrap(width - 2 * inch, 0)[1]
    main_table.drawOn(p, inch, y_pos - main_table_height)
    y_pos -= (main_table_height + 0.4 * inch)

    # Add notes section
    p.setFont("Helvetica-Bold", 11)
    p.drawString(inch, y_pos, "Note:")
    y_pos -= 0.25 * inch
    exam_type_display = exam_type.upper()
    notes = [
        f"1. All Students are expected to sign the {exam_type_display} Attendance Register as evidence that one has sat for the {exam_type_display}.",
        f"2. The {exam_type_display} docket is not the Exam Attendance Register.",
        f"3. Students must only sign this document on the last day of their {exam_type_display} and leave the form with the invigilator.",
        f"4. This document is a proof that the student has registered for the {exam_type_display}.",
        "5. All students must possess a CUZ ID card and Authorization from Finance."
    ]
    for note in notes:
        p.setFont("Helvetica", 10)
        p.drawString(inch + 0.2*inch, y_pos, note)
        y_pos -= 0.2 * inch
    y_pos -= 0.4 * inch

    # Add signature lines
    p.drawString(inch, y_pos, "Signed: ............................................")
    p.drawString(inch + 0.5*inch, y_pos - 0.2*inch, "Finance")
    p.drawString(width - 4.5*inch, y_pos, "Signed: ............................................")
    p.drawString(width - 4.0*inch, y_pos - 0.2*inch, "Student")
    y_pos -= 1.0 * inch
    p.drawString(inch, y_pos, "Signed: ............................................")
    p.drawString(inch + 0.5*inch, y_pos - 0.2*inch, "Dean of BIT")
    p.drawString(width - 4.5*inch, y_pos, "Date: ............................................")

    # Generate and draw QR code for verification
    qr_img = qrcode.make(qr_data)
    qr_path = f"temp_qr_{student['student_number']}.png"
    qr_img.save(qr_path)
    p.drawImage(qr_path, width - inch - 1.2*inch, 1.5*inch, width=1.2*inch, height=1.2*inch, preserveAspectRatio=True)
    os.remove(qr_path) # Clean up temporary QR code image

    p.showPage()
    p.save()
    buffer.seek(0)
    return buffer

import json

# Define file paths securely at the top level of the module
backend_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(os.path.dirname(backend_dir))
SETTINGS_FILE = os.path.join(project_root, 'Docket-system-backend', 'exam_settings.json')
BLOCKLIST_FILE = os.path.join(project_root, 'Docket-system-backend', 'blocked_students.json')

# Helper function to read JSON files
def read_json_file(file_path):
    try:
        with open(file_path, 'r') as f:
            return json.load(f)
    except (FileNotFoundError, json.JSONDecodeError):
        if 'settings' in file_path:
            return {"active_exam": "cat1"}
        else:
            return []

# ---------------- Route: Check Eligibility ----------------
# Checks a student's eligibility for a specific exam type based on blocklist and financial clearance.
@dockets_bp.route("/eligibility/<student_id>", methods=["GET"])
@jwt_required()
def check_eligibility(student_id):
    # Read settings and blocklist first
    settings = read_json_file(SETTINGS_FILE)
    blocklist = read_json_file(BLOCKLIST_FILE)
    active_exam = settings.get("active_exam", "cat1")

    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)

    # Get student number to check against the blocklist
    cur.execute("SELECT student_number FROM students WHERE id=%s LIMIT 1", (student_id,))
    student_info = cur.fetchone()
    if not student_info:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "Student not found."}), 404

    student_number = student_info['student_number']

    # 1. Check if student is blocked
    if student_number in blocklist:
        eligibility_list = [
            {"exam_type": "ca1", "eligible": False, "reason": "Account blocked. Please visit the Retentions Office."},
            {"exam_type": "ca2", "eligible": False, "reason": "Account blocked. Please visit the Retentions Office."},
            {"exam_type": "exam", "eligible": False, "reason": "Account blocked. Please visit the Retentions Office."},
        ]
        cur.close()
        conn.close()
        return jsonify({"ok": True, "eligibility": eligibility_list})

    # 2. Get clearance status from DB
    cur.execute(
        "SELECT ca1_status, ca2_status, exam_status FROM clearances WHERE student_id=%s LIMIT 1",
        (student_id,),
    )
    row = cur.fetchone()
    cur.close()
    conn.close()

    if not row:
        return jsonify({"ok": False, "error": "No clearance records found."}), 404

    # 3. Determine eligibility based on active exam and clearance status
    db_status = {
        "ca1": row["ca1_status"] == "eligible",
        "ca2": row["ca2_status"] == "eligible",
        "exam": row["exam_status"] == "eligible",
    }

    eligibility_list = []
    for exam_type in ["ca1", "ca2", "exam"]:
        is_active = (exam_type == active_exam)
        is_clear = db_status[exam_type]
        reason = ""
        
        if not is_active:
            reason = "Docket not currently active."
        elif not is_clear:
            reason = "Not cleared by Finance. Please visit the Retentions Office."

        eligibility_list.append({
            "exam_type": exam_type,
            "eligible": is_active and is_clear,
            "reason": reason
        })

    return jsonify({"ok": True, "eligibility": eligibility_list})

# ---------------- Route: Generate Docket ----------------
# Generates an exam docket PDF for a student, including eligibility checks, course information, and a QR code.
@dockets_bp.route("/generate", methods=["GET", "POST"])
@jwt_required()
def generate_docket():
    if request.method == "POST":
        data = request.json
        student_id = data.get("student_id")
        exam_type = data.get("exam_type")
        is_preview = data.get("preview", False)
    else:  # GET request
        student_id = request.args.get("student_id")
        exam_type = request.args.get("exam_type")
        is_preview = request.args.get("preview", "false").lower() == "true"

    if not student_id or not exam_type:
        return jsonify({"ok": False, "error": "Missing parameters"}), 400

    # Perform eligibility checks based on active exam, blocklist, and financial clearance.
    settings = read_json_file(SETTINGS_FILE)
    blocklist = read_json_file(BLOCKLIST_FILE)
    active_exam = settings.get("active_exam", "cat1")

    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)

    cur.execute("SELECT student_number FROM students WHERE id=%s LIMIT 1", (student_id,))
    student_info = cur.fetchone()
    if not student_info:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "Student not found."}), 404

    if student_info['student_number'] in blocklist:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "Account blocked. Please visit the Retentions Office."}), 403

    if exam_type != active_exam:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": f"Docket for {exam_type.upper()} is not currently active."}), 403

    # Check clearance from DB
    cur.execute(
        "SELECT ca1_status, ca2_status, exam_status FROM clearances WHERE student_id=%s LIMIT 1",
        (student_id,),
    )
    clearance = cur.fetchone()
    if not clearance:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "No clearance record found."}), 404

    status_map = {
        "ca1": clearance["ca1_status"],
        "ca2": clearance["ca2_status"],
        "exam": clearance["exam_status"]
    }
    if status_map.get(exam_type) != "eligible":
        cur.close()
        conn.close()
        return jsonify({
            "ok": False,
            "error": f"Not eligible for {exam_type.upper()} docket. Please visit the Retentions Office."
        }), 403

    # Fetch student and course information from the database.
    cur.execute('''
        SELECT s.id, s.first_name, s.last_name, s.student_number, s.programme_id, p.programme_name, s.current_year, s.current_semester
        FROM students s
        JOIN programmes p ON s.programme_id = p.programme_id
        WHERE s.id = %s
    ''', (student_id,))
    student = cur.fetchone()

    cur.execute('''
        SELECT c.course_code, c.course_name
        FROM enrollments e
        JOIN curriculum cu ON e.curriculum_id = cu.curriculum_id
        JOIN courses c ON cu.course_id = c.course_id
        WHERE e.student_id = %s
        ORDER BY c.course_name ASC
    ''', (student_id,))
    courses = cur.fetchall()

    if not student:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "Student not found."}), 404
    if not courses:
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": "No enrolled courses found."}), 404

    # Generate QR data and token for docket verification.
    token_value = secrets.token_urlsafe(16)
    token_hash = hashlib.sha256(token_value.encode()).hexdigest()
    qr_data = f"{student['student_number']}|{exam_type}|{token_value}"

    try:
        # Ensure an active token key exists for verification, creating one if necessary.
        cur.execute("SELECT key_id, secret_key FROM token_keys WHERE status='active' LIMIT 1")
        key_row = cur.fetchone()
        if not key_row:
            new_secret_key = secrets.token_urlsafe(32)
            cur.execute('''
                INSERT INTO token_keys (key_name, secret_key, created_at, status)
                VALUES (%s, %s, NOW(), %s)
            ''', ("default_verification_key", new_secret_key, "active"))
            token_key_id = cur.lastrowid
            secret_key_for_docket = new_secret_key
        else:
            token_key_id = key_row["key_id"]
            secret_key_for_docket = key_row["secret_key"]

        # Save docket and token information to the database.
        cur.execute('''
            INSERT INTO dockets (student_id, programme_id, exam_type, year_of_study, semester, qr_code, issued_at, status, printed_count, created_at, updated_at)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())
        ''', (
            student['id'],
            student['programme_id'],
            exam_type,
            student['current_year'],
            student['current_semester'],
            qr_data,
            datetime.now(),
            "issued",
            1
        ))
        docket_id = cur.lastrowid

        cur.execute('''
            INSERT INTO docket_tokens (docket_id, token_hash, issued_at, status)
            VALUES (%s, %s, %s, %s)
        ''', (
            docket_id,
            token_hash,
            datetime.now(),
            "active"
        ))

        conn.commit()
    except Exception as e:
        conn.rollback()
        cur.close()
        conn.close()
        return jsonify({"ok": False, "error": f"Failed to save docket/token: {e}"}), 500

    cur.close()
    conn.close()

    # Generate and return the docket PDF.
    pdf_buffer = generate_docket_pdf(student, courses, exam_type, qr_data)
    return send_file(
        pdf_buffer,
        as_attachment=not is_preview,
        download_name=f"{student['student_number']}{exam_type} docket.pdf",
        mimetype="application/pdf"
    )

@dockets_bp.route("/payments", methods=["GET"])
@jwt_required(role="admin")
def get_payments():
    # Retrieves a list of all students with their payment balance information.
    try:
        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)

        cur.execute("""
            SELECT DISTINCT s.id, s.first_name, s.last_name, s.student_number, p.programme_name, sb.total_fee, sb.amount_paid, sb.balance
            FROM students s
            JOIN programmes p ON s.programme_id = p.programme_id
            LEFT JOIN student_balances sb ON s.id = sb.student_id
            ORDER BY s.last_name, s.first_name
        """)
        students = cur.fetchall()

        cur.close()
        conn.close()

        return jsonify({"ok": True, "students": students})
    except Exception as e:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
        return jsonify({"ok": False, "error": f"Failed to retrieve payments: {str(e)}"}), 500


@dockets_bp.route("/students/search", methods=["GET"])
@jwt_required(role="admin")
def search_students():
    # Searches for students by name or student number.
    query = request.args.get("q", "").strip()
    if not query:
        return jsonify({"ok": True, "students": []})

    try:
        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)

        # Heuristic: If the query consists only of digits, it's a student number search.
        if query.isdigit():
            sql = """
                SELECT DISTINCT s.id, s.first_name, s.last_name, s.student_number, p.programme_name, 
                        sb.total_fee, sb.amount_paid, sb.balance
                FROM students s
                JOIN programmes p ON s.programme_id = p.programme_id
                LEFT JOIN student_balances sb ON s.id = sb.student_id 
                    AND s.current_year = sb.year_of_study 
                    AND s.current_semester = sb.semester
                WHERE s.student_number = %s
                ORDER BY s.last_name, s.first_name
                LIMIT 1
            """
            params = (query,)
        else:
            # Perform a LIKE search for names or partial student numbers
            search_query = f"%{query}%"
            sql = """
                SELECT DISTINCT s.id, s.first_name, s.last_name, s.student_number, p.programme_name, 
                        sb.total_fee, sb.amount_paid, sb.balance
                FROM students s
                JOIN programmes p ON s.programme_id = p.programme_id
                LEFT JOIN student_balances sb ON s.id = sb.student_id 
                    AND s.current_year = sb.year_of_study 
                    AND s.current_semester = sb.semester
                WHERE s.first_name LIKE %s OR s.last_name LIKE %s OR s.student_number LIKE %s
                ORDER BY s.last_name, s.first_name
            """
            params = (search_query, search_query, search_query)

        cur.execute(sql, params)
        students = cur.fetchall()

        cur.close()
        conn.close()

        return jsonify({"ok": True, "students": students})
    except Exception as e:
        if 'cur' in locals():
            cur.close()
        if 'conn' in locals():
            conn.close()
        return jsonify({"ok": False, "error": f"Search failed: {str(e)}"}), 500

@dockets_bp.route("/payments/update", methods=["POST"])
@jwt_required(role="admin")
def update_payment():
    # Updates a student's payment record and recalculates their eligibility for exams.
    data = request.json
    student_number = data.get("student_number")
    amount = data.get("amount")
    db_platform = os.getenv("DB_PLATFORM")

    if not student_number or not amount:
        return jsonify({"ok": False, "error": "Missing student_number or amount"}), 400

    try:
        amount = float(amount)
    except (ValueError, TypeError):
        return jsonify({"ok": False, "error": "Invalid amount format"}), 400

    conn = get_db_connection()
    cur = conn.cursor(dictionary=True, buffered=True)

    try:
        conn.start_transaction()

        cur.execute("SELECT id, programme_id, current_year, current_semester FROM students WHERE student_number = %s", (student_number,))
        student = cur.fetchone()
        if not student:
            raise Exception("Student not found.")

        student_id = student["id"]
        programme_id = student["programme_id"]

        cur.execute("""
            INSERT INTO payments (student_id, programme_id, amount, payment_type, payment_date, payment_status)
            VALUES (%s, %s, %s, %s, NOW(), %s)
        """, (student_id, programme_id, amount, "General", "completed"))

        # If not on XAMPP, perform manual updates. Otherwise, triggers will handle it.
        if db_platform != 'XAMPP':
            current_year = student["current_year"]
            current_semester = student["current_semester"]

            cur.execute("""
                UPDATE student_balances SET amount_paid = amount_paid + %s, last_updated = NOW()
                WHERE student_id = %s AND programme_id = %s AND year_of_study = %s AND semester = %s
            """, (amount, student_id, programme_id, current_year, current_semester))

            if cur.rowcount == 0:
                raise Exception("No matching student balance record found to update.")

            cur.execute("""
                SELECT amount_paid, total_fee FROM student_balances
                WHERE student_id = %s AND programme_id = %s AND year_of_study = %s AND semester = %s
            """, (student_id, programme_id, current_year, current_semester))
            balance_data = cur.fetchone()
            if not balance_data:
                raise Exception("Student balance record not found after update.")

            amount_paid = balance_data["amount_paid"]
            total_fee = balance_data["total_fee"]

            cur.execute("SELECT exam_type, required_percentage FROM fee_schedule")
            rules = cur.fetchall()
            
            ca1_req = next((r['required_percentage'] for r in rules if r['exam_type'] == 'CA1'), 0)
            ca2_req = next((r['required_percentage'] for r in rules if r['exam_type'] == 'CA2'), 0)
            exam_req = next((r['required_percentage'] for r in rules if r['exam_type'] == 'EXAM'), 0)

            percent_paid = (amount_paid / total_fee) * 100 if total_fee > 0 else 0

            ca1_status = 'eligible' if percent_paid >= ca1_req else 'blocked'
            ca2_status = 'eligible' if percent_paid >= ca2_req else 'blocked'
            exam_status = 'eligible' if percent_paid >= exam_req else 'blocked'

            cur.execute("""
                UPDATE clearances SET ca1_status = %s, ca2_status = %s, exam_status = %s, last_checked = NOW()
                WHERE student_id = %s AND programme_id = %s AND year_of_study = %s AND semester = %s
            """, (ca1_status, ca2_status, exam_status, student_id, programme_id, current_year, current_semester))

        conn.commit()
        
        return jsonify({"ok": True, "message": "Payment recorded successfully."}), 200

    except mysql.connector.Error as err:
        conn.rollback()
        return jsonify({"ok": False, "error": f"Database error: {err}"}), 500
    except Exception as e:
        conn.rollback()
        return jsonify({"ok": False, "error": f"An unexpected error occurred: {e}"}), 500
    finally:
        cur.close()
        conn.close()

@dockets_bp.route("/sync/students", methods=["GET"])
@jwt_required(role="admin")
def sync_students():
    # Endpoint to get all student details for offline caching.
    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("""
        SELECT s.id, s.first_name, s.last_name, s.student_number, p.programme_name
        FROM students s
        JOIN programmes p ON s.programme_id = p.programme_id
        ORDER BY s.student_number
    """)
    students = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify({"ok": True, "students": students})

@dockets_bp.route("/sync/tokens", methods=["GET"])
@jwt_required(role="admin")
def sync_tokens():
    # Endpoint to get all active docket tokens for offline verification.
    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT token_hash FROM docket_tokens WHERE status = 'active'")
    tokens = [row['token_hash'] for row in cur.fetchall()]
    cur.close()
    conn.close()
    return jsonify({"ok": True, "tokens": tokens})
