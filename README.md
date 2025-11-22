# Student Docket Management System

A web-based application designed to manage student exam dockets, facilitate fee payments, and enable lecturers to verify dockets using QR codes. The system features a Progressive Web App (PWA) architecture, allowing for offline verification of student dockets in areas with poor internet connectivity.

## 🚀 Features

### For Students
*   **Secure Login:** Access via student number and password.
*   **Dashboard:** View personal details and current program information.
*   **Exam Eligibility:** Check eligibility for CA1, CA2, and Final Exams based on fee clearance.
*   **Docket Download:** Generate and download PDF dockets with embedded QR codes.

### For Administrators (Lecturers/Finance)
*   **Admin Dashboard:** Comprehensive view of student payments and exam settings.
*   **QR Code Verification:** Scan student dockets to verify validity instantly.
*   **Offline Mode:** Verify dockets without internet access (data syncs when back online).
*   **Student Management:** Block/Unblock students from accessing dockets.
*   **Exam Settings:** Toggle the currently active exam session (CA1, CA2, Exam).
*   **Payment Management:** Record and update student fee payments.

## 🛠️ Tech Stack

*   **Backend:** Python (Flask)
*   **Database:** MySQL / MariaDB (Supports local XAMPP and TiDB Cloud)
*   **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
*   **PDF Generation:** ReportLab
*   **Authentication:** JWT (JSON Web Tokens)
*   **Offline Capability:** Service Workers & IndexedDB

## 📋 Prerequisites

*   Python 3.8+
*   MySQL Server (e.g., XAMPP, MariaDB, or TiDB)
*   `pip` (Python package manager)

## ⚙️ Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Docket_management_system
```

### 2. Backend Setup
Navigate to the backend directory:
```bash
cd Docket-system-backend
```

Create a virtual environment (recommended):
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

Install dependencies:
```bash
pip install -r requirements.txt
```

### 3. Database Configuration
1.  Create a MySQL database named `docket_system2`.
2.  Import the schema from `docket_system2_tidb.sql` (or `_xampp.sql` if using local XAMPP).
    ```bash
    mysql -u root -p docket_system2 < docket_system2_tidb.sql
    ```

### 4. Environment Variables
Create a `.env` file in the `Docket-system-backend` directory with the following content:

**For Local XAMPP:**
```env
DB_PLATFORM=XAMPP
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=docket_system2
JWT_SECRET=your-super-secret-key
```

**For TiDB / Remote DB:**
```env
DB_PLATFORM=TIDB
HOST=your-tidb-host
PORT=4000
USERNAME=your-username
PASSWORD=your-password
DATABASE=docket_system2
CA_PATH=/path/to/ca.pem
JWT_SECRET=your-super-secret-key
```

### 5. Run the Application
```bash
python app.py
```
The server will start at `http://127.0.0.1:5000`.

## 📖 Usage

### Accessing the Portal
*   **Web Interface:** Open your browser and navigate to `http://127.0.0.1:5000`.
*   **Default Admin Credentials:** (Check database or `admins` table seed data)
*   **Default Student Credentials:** (Check `students` table seed data)

### Offline Verification (PWA)
1.  Log in as an admin while online.
2.  The application will cache necessary resources and student tokens.
3.  You can now disconnect from the internet and use the "Scan QR" feature.
4.  Scanned data is saved locally. When connection is restored, the system automatically syncs verification logs to the server.

## 📂 Project Structure

```
Docket_management_system/
├── Docket-system-backend/   # Flask Application
│   ├── routes/              # API Endpoints (dockets, verification, admin)
│   ├── utils/               # Helper functions
│   ├── app.py               # Entry point
│   └── ...
├── Docket-system-frontend/  # Static Assets
│   ├── frontend/            # HTML, CSS, JS files
│   ├── sw.js                # Service Worker for PWA
│   └── ...
└── README.md
```

## 🤝 Contributing
Contributions are welcome! Please fork the repository and create a pull request for any feature enhancements or bug fixes.

## 📄 License
[MIT License](LICENSE)
