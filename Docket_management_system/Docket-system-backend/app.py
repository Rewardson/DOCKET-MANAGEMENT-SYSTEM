import os
import datetime
from functools import wraps
from flask import Flask, jsonify, request, send_from_directory
from flask_cors import CORS
import mysql.connector
from dotenv import load_dotenv
import jwt
from passlib.hash import bcrypt
import sys

# Add backend directory to Python path for module imports
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Load environment variables from .env file
load_dotenv()

# Configure Flask app to serve frontend static files
backend_dir = os.path.dirname(os.path.abspath(__file__))
project_root = os.path.dirname(backend_dir)
frontend_dir = os.path.join(project_root, "Docket-system-frontend", "frontend")

app = Flask(
    __name__,
    static_folder=frontend_dir,
    static_url_path=""
)
# Enable CORS for cross-origin requests
CORS(app, supports_credentials=True, resources={r"/*": {"origins": "*"}})

# JWT (JSON Web Token) configuration
JWT_SECRET = os.getenv("JWT_SECRET", "change-me-please-and-use-long-random")
JWT_ALGO = "HS256"
JWT_EXP_SECONDS = int(os.getenv("JWT_EXP_SECONDS", 60 * 60 * 8))  # 8 hours


# -------------------- Database Connection --------------------
# Establishes a database connection, supporting both local XAMPP (MariaDB) and TiDB with SSL.
def get_db_connection():
    db_platform = os.getenv("DB_PLATFORM")

    try:
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
            # Configuration for TiDB with SSL
            ca_path = os.getenv("CA_PATH")
            if ca_path and not os.path.exists(ca_path):
                # If CA_PATH is provided but file doesn't exist, it might be the cert content
                ca_path = "/tmp/tidb_ca.pem"
                with open(ca_path, "w") as f:
                    f.write(os.getenv("CA_PATH"))
            return mysql.connector.connect(
                host=os.getenv("HOST"),
                port=int(os.getenv("PORT", 4000)),
                user=os.getenv("USERNAME"),
                password=os.getenv("PASSWORD"),
                database=os.getenv("DATABASE"),
                autocommit=False,
                ssl_ca=ca_path,
                ssl_verify_cert=False
            )
        # else: # Default to render
        #     # Default configuration for Render with SSL
        #     return mysql.connector.connect(
        #         host=os.getenv("DB_HOST"),
        #         user=os.getenv("DB_USER"),
        #         password=os.getenv("DB_PASSWORD"),
        #         database=os.getenv("DB_NAME"),
        #         autocommit=False,
        #         ssl_verify_cert=True,
        #         ssl_ca=os.getenv("DB_SSL_CA_PATH", "/etc/ssl/certs/ca-certificates.crt") # Common path for CA certs
        #     )
    except mysql.connector.Error as err:
        app.logger.error(f"Database connection error ({db_platform}): {err}")
        raise


# -------------------- JWT Auth Decorator --------------------
# Decorator to protect routes, ensuring only authenticated and authorized users can access them based on JWT and roles.
def jwt_required(role=None):
    def decorator(f):
        @wraps(f)
        def wrapper(*args, **kwargs):
            auth = request.headers.get("Authorization", "")
            token = None

            if auth.startswith("Bearer "):
                token = auth.split(" ", 1)[1]
            else:
                token = request.cookies.get("access_token")

            if not token:
                return jsonify({"ok": False, "error": "Missing token"}), 401

            try:
                payload = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGO])
            except jwt.ExpiredSignatureError:
                return jsonify({"ok": False, "error": "Token expired"}), 401
            except Exception as e:
                return jsonify({"ok": False, "error": f"Invalid token: {e}"}), 401

            if role and payload.get("role") != role:
                return jsonify({"ok": False, "error": "Forbidden"}), 403

            request.user = payload
            return f(*args, **kwargs)
        return wrapper
    return decorator


# -------------------- Routes --------------------
# Basic API route to confirm backend is running.
@app.route("/api")
def home():
    return jsonify({"message": "Docket System Backend Running ✅"})


# Handles user login, authenticates credentials, generates JWT, and sets cookies.
@app.route("/login", methods=["POST"])
def login():
    try:
        data = request.json or {}
        username = data.get("student_number")
        password = data.get("password")
        role = data.get("role", "student")
        use_cookie = data.get("use_cookie", False)

        if not username or not password:
            return jsonify({"ok": False, "error": "Missing credentials"}), 400

        conn = get_db_connection()
        cur = conn.cursor(dictionary=True)

        if role == "admin":
            cur.execute(
                "SELECT admin_id AS id, username, password_hash FROM admins WHERE username=%s LIMIT 1",
                (username,)
            )
        else:
            cur.execute(
                "SELECT id, student_number, password_hash, first_name, last_name "
                "FROM students WHERE student_number=%s LIMIT 1",
                (username,)
            )

        user = cur.fetchone()
        cur.close()
        conn.close()

        if not user or not user.get("password_hash"):
            return jsonify({"ok": False, "error": "Invalid credentials"}), 401

        # I truncated the password to 72 bytes to avoid bcrypt error I was getting
        password = password[:72]

        if not bcrypt.verify(password, user["password_hash"]):
            return jsonify({"ok": False, "error": "Invalid credentials"}), 401

        now = datetime.datetime.utcnow()
        payload = {
            "sub": str(user["id"]),
            "role": role,
            "iat": now,
            "exp": now + datetime.timedelta(seconds=JWT_EXP_SECONDS)
        }

        token = jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGO)

        resp = jsonify({
            "ok": True,
            "token": token,
            "user": {
                "id": user["id"],
                "first_name": user.get("first_name"),
                "last_name": user.get("last_name"),
                "student_number": user.get("student_number"), # Add student_number here
                "role": role
            }
        })

        if use_cookie:
            resp.set_cookie(
                "access_token",
                token,
                httponly=True,
                samesite="Lax"
            )
        return resp

    except mysql.connector.Error as err:
        app.logger.error(f"Database error during login: {err}")
        return jsonify({"ok": False, "error": "Database connection error. Please try again later."}), 500


# Handles user logout by clearing the access token cookie.
@app.route("/logout", methods=["POST"])
@jwt_required()
def logout():
    resp = jsonify({"ok": True})
    resp.set_cookie("access_token", "", expires=0)
    return resp


# Returns information about the currently authenticated user.
@app.route("/me", methods=["GET"])
@jwt_required()
def me():
    payload = request.user
    return jsonify({"ok": True, "user": payload})


# -------------------- Serve Frontend --------------------
# Serves the main admin portal HTML file.
@app.route("/")
def serve_index():
    """Serve admin portal HTML"""
    return send_from_directory(app.static_folder, "admin-login.html")


# Serves all other static frontend files (CSS, JS, images, etc.).
@app.route("/<path:path>")
def serve_static_files(path):
    """Serve static frontend files (HTML, CSS, JS, etc.)"""
    file_path = os.path.join(app.static_folder, path)
    if os.path.exists(file_path):
        return send_from_directory(app.static_folder, path)
    else:
        return jsonify({"error": "File not found"}), 404


# -------------------- Health Check --------------------
# Endpoint for application health checks.
@app.route("/health")
def health_check():
    return "OK", 200


# -------------------- Register Blueprints --------------------
# Import and register blueprints for modularizing routes.
from routes.dockets import dockets_bp
from routes.verification import verification_bp
from routes.admin_controls import admin_controls_bp
app.register_blueprint(dockets_bp, url_prefix="/dockets")
app.register_blueprint(verification_bp, url_prefix="/verification")
app.register_blueprint(admin_controls_bp, url_prefix="/admin")


# -------------------- Run Server --------------------
# Entry point to run the Flask development server.
if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1')