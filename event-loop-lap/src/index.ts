import express from 'express';
import { initializeFirebase } from './db/firebase';
import creditCardsRouter from './routes/credit-cards';

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ limit: '10mb', extended: true }));

app.use((req, res, next) => {
  console.log(`${req.method} ${req.path}`, {
    bodyLength: req.body ? JSON.stringify(req.body).length : 0,
    contentType: req.get('content-type'),
  });
  next();
});

try {
  initializeFirebase();
  console.log('Firebase initialized successfully');
} catch (error) {
  console.error('Failed to initialize Firebase:', error);
  process.exit(1);
}


app.use('/api/v1/credit-cards', creditCardsRouter);


app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

export default app;
