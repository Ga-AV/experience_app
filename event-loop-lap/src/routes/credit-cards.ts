import admin from 'firebase-admin';
import { Router, Request, Response } from 'express';
import { getDb } from '../db/firebase';
import {
  validateCardNumber,
  validateCVV,
  validateExpirationDate,
} from '../validators/card-validator';
import type {
  CreditCard,
  CreateCreditCardRequest,
  UpdateCreditCardRequest,
  CreditCardResponse,
} from '../types/credit-card';

const router = Router();

function cardToResponse(card: CreditCard): CreditCardResponse {
  return {
    id: card.id,
    userId: card.userId,
    cardNumber: card.cardNumber,
    cardNetwork: card.cardNetwork,
    cvv: card.cvv,
    expirationDate: card.expirationDate,
    creditLimit: card.creditLimit,
    status: card.status,
    createdAt: card.createdAt,
    updatedAt: card.updatedAt,
  };
}

router.get('/', async (req: Request, res: Response): Promise<void> => {
  try {
    const db = getDb();
    const snapshot = await db
      .collection('credit_cards')
      .where('status', '==', 'active')
      .where('isDeleted', '==', false)
      .get();

    const cards: CreditCardResponse[] = snapshot.docs.map((doc) => {
      const data = doc.data();
      return cardToResponse({
        id: doc.id,
        userId: data.userId,
        cardNumber: data.cardNumber,
        cardNetwork: data.cardNetwork,
        cvv: data.cvv,
        expirationDate: data.expirationDate,
        creditLimit: data.creditLimit,
        status: data.status,
        isDeleted: data.isDeleted,
        createdAt: data.createdAt?.toDate() || new Date(),
        updatedAt: data.updatedAt?.toDate() || new Date(),
      });
    });

    res.status(200).json(cards);
  } catch (error) {
    console.error('Error fetching credit cards:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.get('/:id', async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;
    const db = getDb();
    const doc = await db.collection('credit_cards').doc(id).get();

    if (!doc.exists || doc.data()?.isDeleted) {
      res.status(404).json({ error: 'Credit card not found' });
      return;
    }

    const data = doc.data()!;
    const card = cardToResponse({
      id: doc.id,
      userId: data.userId,
      cardNumber: data.cardNumber,
      cardNetwork: data.cardNetwork,
      cvv: data.cvv,
      expirationDate: data.expirationDate,
      creditLimit: data.creditLimit,
      status: data.status,
      isDeleted: data.isDeleted,
      createdAt: data.createdAt?.toDate() || new Date(),
      updatedAt: data.updatedAt?.toDate() || new Date(),
    });

    res.status(200).json(card);
  } catch (error) {
    console.error('Error fetching credit card:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.post('/', async (req: Request, res: Response): Promise<void> => {
  try {
    console.log('POST /credit-cards received:', { body: req.body, headers: req.headers });
    
    const body = req.body as CreateCreditCardRequest;

    if (!body || typeof body !== 'object') {
      console.log('Body validation failed:', body);
      res.status(400).json({
        error: 'Request body is required',
      });
      return;
    }

    if (!body.userId || body.limit === undefined) {
      console.log('Missing required fields:', { userId: body.userId, limit: body.limit });
      res.status(400).json({
        error: 'Missing required fields: userId and limit are required',
      });
      return;
    }

    if (!body.cardNumber || !body.cardNetwork || !body.cvv || !body.expirationDate) {
      res.status(400).json({
        error: 'Missing required card fields',
      });
      return;
    }

    if (!validateCardNumber(body.cardNumber, body.cardNetwork)) {
      res.status(400).json({
        error: 'Invalid card number for the specified network',
      });
      return;
    }

    if (!validateCVV(body.cvv, body.cardNetwork)) {
      res.status(400).json({
        error: 'Invalid CVV for the specified network',
      });
      return;
    }

    if (!validateExpirationDate(body.expirationDate)) {
      res.status(400).json({
        error: 'Invalid or expired expiration date (format: MM/YY)',
      });
      return;
    }

    const db = getDb();
    const now = new Date();
    const newCard: CreditCard = {
      id: '', 
      userId: body.userId,
      cardNumber: body.cardNumber,
      cardNetwork: body.cardNetwork,
      cvv: body.cvv,
      expirationDate: body.expirationDate,
      creditLimit: body.limit,
      status: 'active',
      isDeleted: false,
      createdAt: now,
      updatedAt: now,
    };

    const docRef = await db.collection('credit_cards').add({
      ...newCard,
      createdAt: admin.firestore.Timestamp.fromDate(now),
      updatedAt: admin.firestore.Timestamp.fromDate(now),
    });

    const created = cardToResponse({
      ...newCard,
      id: docRef.id,
    });

    res.status(201).json(created);
  } catch (error) {
    console.error('Error creating credit card:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.patch('/:id', async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;
    const body: UpdateCreditCardRequest = req.body;

    const db = getDb();
    const doc = await db.collection('credit_cards').doc(id).get();

    if (!doc.exists || doc.data()?.isDeleted) {
      res.status(404).json({ error: 'Credit card not found' });
      return;
    }

    const updates: Record<string, any> = {
      updatedAt: admin.firestore.Timestamp.fromDate(new Date()),
    };

    if (body.creditLimit !== undefined) {
      updates.creditLimit = body.creditLimit;
    }

    if (body.status !== undefined) {
      updates.status = body.status;
    }

    if (Object.keys(updates).length === 1) {
      res.status(400).json({
        error: 'At least one of creditLimit or status must be provided',
      });
      return;
    }

    await db.collection('credit_cards').doc(id).update(updates);

    const updatedDoc = await db.collection('credit_cards').doc(id).get();
    const data = updatedDoc.data()!;
    const card = cardToResponse({
      id: updatedDoc.id,
      userId: data.userId,
      cardNumber: data.cardNumber,
      cardNetwork: data.cardNetwork,
      cvv: data.cvv,
      expirationDate: data.expirationDate,
      creditLimit: data.creditLimit,
      status: data.status,
      isDeleted: data.isDeleted,
      createdAt: data.createdAt?.toDate() || new Date(),
      updatedAt: data.updatedAt?.toDate() || new Date(),
    });

    res.status(200).json(card);
  } catch (error) {
    console.error('Error updating credit card:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.delete('/:id', async (req: Request, res: Response): Promise<void> => {
  try {
    const { id } = req.params;
    const db = getDb();
    const doc = await db.collection('credit_cards').doc(id).get();

    if (!doc.exists || doc.data()?.isDeleted) {
      res.status(404).json({ error: 'Credit card not found' });
      return;
    }

    await db.collection('credit_cards').doc(id).update({
      isDeleted: true,
      status: 'inactive',
      updatedAt: admin.firestore.Timestamp.fromDate(new Date()),
    });

    res.status(204).send();
  } catch (error) {
    console.error('Error deleting credit card:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

export default router;
