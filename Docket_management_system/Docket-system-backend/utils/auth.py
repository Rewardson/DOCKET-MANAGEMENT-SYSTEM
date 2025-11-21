from functools import wraps
from flask import request, jsonify
import jwt
import os
from dotenv import load_dotenv

# Load environment variables from .env file for configuration
load_dotenv()

# JWT (JSON Web Token) configuration for authentication
JWT_SECRET = os.getenv("JWT_SECRET", "change-me-please-and-use-long-random") # Secret key for signing JWTs
JWT_ALGO = "HS256" # Algorithm used for signing JWTs

# Decorator to protect routes, ensuring only authenticated and authorized users can access them.
# It extracts a JWT from the request, validates it, and checks for required roles.
def jwt_required(role=None):
    def decorator(f):
        @wraps(f) # Preserves the original function's metadata
        def wrapper(*args, **kwargs):
            # Attempt to get the token from the Authorization header (Bearer token) or from cookies
            auth = request.headers.get("Authorization", "")
            token = None

            if auth.startswith("Bearer "):
                token = auth.split(" ", 1)[1] # Extract token from "Bearer <token>"
            else:
                token = request.cookies.get("access_token") # Get token from HTTP-only cookie

            # If no token is found, return an unauthorized error
            if not token:
                return jsonify({"ok": False, "error": "Missing token"}), 401

            try:
                # Decode the JWT using the secret key and algorithm
                payload = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGO])
            except jwt.ExpiredSignatureError:
                # Handle expired tokens gracefully
                return jsonify({"ok": False, "error": "Token expired"}), 401
            except Exception as e:
                # Handle any other token validation errors (e.g., invalid signature)
                return jsonify({"ok": False, "error": f"Invalid token: {e}"}), 401

            # If a specific role is required for the route, check if the user's role matches
            if role and payload.get("role") != role:
                return jsonify({"ok": False, "error": "Forbidden"}), 403

            # Store the decoded JWT payload in the request object for easy access in the route function
            request.user = payload
            return f(*args, **kwargs)
        return wrapper
    return decorator
