const CACHE_NAME = 'docket-admin-cache-v1';
const urlsToCache = [
  '/admin-dashboard.html',
  '/dashboard.css',
  'https://unpkg.com/html5-qrcode',
  '/cavendish-logo.png'
];

// Install event: opens a cache and adds the core app files to it.
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Opened cache');
        return cache.addAll(urlsToCache);
      })
  );
});

// Fetch event: serves assets from the cache first.
// If the request is not in the cache, it fetches it from the network.
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        if (response) {
          return response;
        }
        return fetch(event.request).catch(() => caches.match('/admin-dashboard.html'));
      })
  );
});

self.addEventListener('sync', event => {
  if (event.tag === 'sync-pending-verifications') {
    event.waitUntil(syncPendingVerifications());
  }
});

function syncPendingVerifications() {
    return new Promise((resolve, reject) => {
        const request = indexedDB.open(DB_NAME, DB_VERSION);
        request.onsuccess = event => {
            const db = event.target.result;
            const transaction = db.transaction(['pending_verifications'], 'readwrite');
            const store = transaction.objectStore('pending_verifications');
            const getAllRequest = store.getAll();
            getAllRequest.onsuccess = () => {
                const pending = getAllRequest.result;
                if (pending.length === 0) {
                    return resolve();
                }
                fetch('/verification/sync', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${localStorage.getItem('token')}`
                    },
                    body: JSON.stringify({ pending_verifications: pending })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.ok) {
                        const clearTransaction = db.transaction(['pending_verifications'], 'readwrite');
                        const clearStore = clearTransaction.objectStore('pending_verifications');
                        clearStore.clear();
                        console.log('Pending verifications synced and cleared.');
                        resolve();
                    } else {
                        reject('Sync failed');
                    }
                })
                .catch(err => reject(err));
            };
        };
    });
}
