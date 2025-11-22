# System Documentation

## 🏗️ System Architecture

The Student Docket Management System follows a standard client-server architecture with an added offline-first capability for specific administrative tasks.

### Components
1.  **Frontend Client:**
    *   Served as static files by the Flask backend.
    *   Interacts with the REST API for data retrieval and actions.
    *   Uses **Service Workers** to cache application shell and critical data for offline usage.
    *   Uses **IndexedDB** to store pending verification logs when the device is offline.

2.  **Backend Server:**
    *   **Flask (Python):** Handles API requests, business logic, and PDF generation.
    *   **Authentication:** Uses JWT (JSON Web Tokens) for stateless authentication.
    *   **ReportLab:** Generates PDF dockets dynamically.

3.  **Database:**
    *   **MySQL:** Stores student records, financial data, academic structures, and verification logs.
    *   Supports both local deployments (XAMPP) and cloud deployments (TiDB).

## 🗄️ Database Schema

The database `docket_system2` consists of several key tables relating to students, academics, and finance.

### Key Tables
*   **`students`**: Stores student profiles and login credentials.
*   **`admins`**: Stores administrator accounts and roles (e.g., Finance Officer, Exam Officer).
*   **`programmes` & `courses`**: Defines the academic structure.
*   **`enrollments`**: Links students to specific courses.
*   **`dockets`**: Records generated dockets for specific exams.
*   **`docket_tokens`**: Stores secure hashes for QR code verification.
*   **`payments`**: Logs student fee payments.
*   **`student_balances`**: Tracks total fees vs. amount paid.
*   **`clearances`**: Determines if a student is eligible for CA1, CA2, or Exams based on payment thresholds.
*   **`verifications`**: Logs successful docket scans.

## 🔌 API Reference

### Authentication
| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `POST` | `/login` | Authenticates user and returns a JWT. |
| `POST` | `/logout` | Clears the authentication cookie. |
| `GET` | `/me` | Returns current user details. |

### Student Dockets
| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `GET` | `/dockets/eligibility/<student_id>` | Checks exam eligibility based on fees. |
| `POST` | `/dockets/generate` | Generates and downloads the docket PDF. |

### Admin & Verification
| Method | Endpoint | Description |
| :--- | :--- | :--- |
| `POST` | `/verification/verify` | Verifies a docket using QR code data. |
| `POST` | `/verification/sync` | Syncs offline verification logs to the server. |
| `GET` | `/dockets/sync/students` | Retrieves student list for offline cache. |
| `GET` | `/dockets/sync/tokens` | Retrieves active tokens for offline cache. |
| `POST` | `/admin/settings` | Updates active exam session (CA1/CA2/Exam). |
| `POST` | `/dockets/payments/update` | Records a new payment for a student. |
| `POST` | `/admin/students/<id>/block` | Blocks a student from accessing dockets. |

## 📱 Offline Verification Workflow (PWA)

1.  **Initialization:** When an admin logs in, the Service Worker fetches list of active tokens and student details via `/dockets/sync/*` endpoints and stores them in IndexedDB.
2.  **Scanning (Offline):**
    *   The QR code scanner reads the token from the physical docket.
    *   The app checks the local IndexedDB for a matching token hash.
    *   If found, it marks it as verified locally and adds a record to the `pending_verifications` store.
3.  **Synchronization:**
    *   When the device regains internet connectivity, the Service Worker detects the network change (or via periodic background sync).
    *   It pushes `pending_verifications` to `/verification/sync`.
    *   The server updates the central database and clears the synced items from the local store.
