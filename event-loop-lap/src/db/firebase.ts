import admin from 'firebase-admin';

let app: admin.app.App | null = null;

export function initializeFirebase(): admin.app.App {
  if (app) {
    return app;
  }

  try {
    app = admin.initializeApp();
  } catch (error) {
    console.error('Firebase initialization error:', error);
    throw error;
  }

  return app;
}

export function getDb(): admin.firestore.Firestore {
  if (!app) {
    throw new Error('Firebase not initialized. Call initializeFirebase() first.');
  }
  return admin.firestore(app);
}

export function closeFirebase(): Promise<void> {
  if (!app) {
    return Promise.resolve();
  }
  return app.delete();
}
