# System Menu - Docket Management System

## Project Overview

This project is a Student Docket Management System. It's a web application designed to allow students to view and download their exam dockets, and for university staff (lecturers, administrators) to verify these dockets using QR codes. The system is built with a Python Flask backend and a plain HTML/CSS/JavaScript frontend.

**Key Features:**

*   **Student Portal:** Students can log in, view their eligibility for dockets, and generate dockets for different exams (CA1, CA2, Final Exam).
*   **Admin Dashboard:** Administrators have a separate interface to manage student data, block/unblock students, and set the currently active exam.
*   **QR Code Verification:** Each docket includes a QR code. A verification page allows staff to scan the QR code to confirm the docket's validity. This is designed to work offline as a Progressive Web App (PWA).
*   **Authentication:** The system uses JSON Web Tokens (JWT) for securing the API endpoints.

**Technologies:**

*   **Backend:** Python, Flask, Gunicorn
*   **Database:** MySQL
*   **Frontend:** HTML, CSS, JavaScript
*   **Key Python Libraries:** Flask-CORS, PyJWT, passlib, qrcode, reportlab, mysql-connector-python

## Building and Running

### 1. Backend Setup

1.  **Install Dependencies:**
    ```bash
    pip install -r Docket-system-backend/requirements.txt
    ```

2.  **Database Setup:**
    *   Make sure you have a MySQL server running.
    *   Create a database (e.g., `docket_system2`).
    *   Import the schema from `docket_system2 .1.sql`.
    *   Configure the database connection by creating a `.env` file in the `Docket-system-backend` directory with the following variables. Ensure `DB_PLATFORM` is set correctly for your environment (e.g., `XAMPP` for local MySQL).
        ```
        DB_PLATFORM=XAMPP
        DB_HOST=localhost
        DB_USER=root
        DB_PASSWORD=newpassword
        DB_NAME=docket_system2
        JWT_SECRET=a_very_secret_key
        ```

3.  **Run the Backend Server:**
    ```bash
    python Docket-system-backend/app.py
    ```
    The server will start on `http://127.0.0.1:5000`.

### 2. Frontend

The frontend is served directly by the Flask backend. No separate build step is required.

*   **Admin Portal:** Access the admin login page by navigating to `http://127.0.0.1:5000` in your web browser.
*   **Student Portal:** Access the student login page by navigating to `http://127.0.0.1:5000/students-portal.html` in your web browser.

### 3. Testing with Ngrok

The `NGROK_SETUP_AND_TESTING.txt` file provides instructions on how to use `ngrok` to expose your local server to the internet for testing the QR code scanning functionality on mobile devices.

## Development Conventions

*   **Modular Structure:** The Flask backend is organized into Blueprints for different parts of the application (e.g., `dockets`, `admin_controls`, `verification`).
*   **Authentication:** API routes are protected using a `@jwt_required` decorator. The JWT can be passed as a Bearer token in the `Authorization` header or as a cookie.
*   **Configuration:** Application and database settings are managed through environment variables.
*   **Frontend Logic:** The frontend uses `localStorage` to store the JWT and basic user information.
*   **Static Files:** The Flask application is configured to serve the frontend's static files (HTML, CSS, JS) from the `Docket-system-frontend/frontend` directory.

## Changelog

### 2025-11-12

*   **Database Connection Fix:** Resolved database connection issues by ensuring correct `.env` configuration, specifically the `DB_PLATFORM` variable, to properly connect to MySQL.
*   **Separate Login Pages:** Ensured complete separation of admin and student login pages. The admin login is at the root (`/`), and the student login is at `/students-portal.html`, with no direct links between them.
*   **Logout Redirects:** Implemented frontend logic to redirect users to their respective login pages (`admin-login.html` for admins, `students-portal.html` for students) upon logout.

### 2025-10-29

*   Prepared the application for deployment on Render.
*   Created the `render.yaml` file to define the web service and database.
*   Pushed the `render.yaml` file to the repository.