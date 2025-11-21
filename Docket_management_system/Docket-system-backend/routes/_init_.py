from flask import Blueprint

# This file serves as the package initializer for the 'routes' directory.
# It imports blueprints from individual route modules, making them discoverable
# and allowing them to be registered with the main Flask application.

from .dockets import dockets_bp

# If you later add more blueprints (like students, admin, etc.)
# you can import them here too.
