const DB_NAME = 'docket_verification_db';
const DB_VERSION = 1;
let db;

function openDB() {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, DB_VERSION);

    request.onupgradeneeded = event => {
      const db = event.target.result;
      if (!db.objectStoreNames.contains('students')) {
        db.createObjectStore('students', { keyPath: 'student_number' });
      }
      if (!db.objectStoreNames.contains('blocked_students')) {
        db.createObjectStore('blocked_students', { keyPath: 'student_number' });
      }
      if (!db.objectStoreNames.contains('active_dockets')) {
        db.createObjectStore('active_dockets', { keyPath: 'token_hash' });
      }
       if (!db.objectStoreNames.contains('pending_verifications')) {
        db.createObjectStore('pending_verifications', { autoIncrement: true });
      }
    };

    request.onsuccess = event => {
      db = event.target.result;
      resolve(db);
    };

    request.onerror = event => {
      reject('IndexedDB error: ' + event.target.errorCode);
    };
  });
}

async function clearAndAddData(storeName, data) {
    if (!db) await openDB();
    return new Promise((resolve, reject) => {
        const transaction = db.transaction([storeName], 'readwrite');
        const store = transaction.objectStore(storeName);
        store.clear(); // Clear existing data
        data.forEach(item => store.add(item));
        transaction.oncomplete = () => resolve();
        transaction.onerror = event => reject(event.target.error);
    });
}
