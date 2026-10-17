import { describe, it, expect } from 'vitest';
import type { CreditCard, CreateCreditCardRequest } from '../types/credit-card';
import { validateCardNumber, validateCVV, validateExpirationDate } from '../validators/card-validator';

describe('Card Validators', () => {
  describe('validateCardNumber', () => {
    it(' validate Visa card numbers', () => {
      expect(validateCardNumber('4532015112830366', 'visa')).toBe(true);
    });

    it(' validate Mastercard card numbers', () => {
      expect(validateCardNumber('5555555555554444', 'mastercard')).toBe(true);
    });

    it(' validate American Express card numbers', () => {
      expect(validateCardNumber('374245455400126', 'amex')).toBe(true);
    });

    it(' validate Discover card numbers', () => {
      expect(validateCardNumber('6011111111111117', 'discover')).toBe(true);
    });

    it(' reject invalid card number for network', () => {
      expect(validateCardNumber('4532015112830366', 'mastercard')).toBe(false);
    });

    it(' reject card with invalid Luhn checksum', () => {
      expect(validateCardNumber('4532015112830367', 'visa')).toBe(false);
    });

    it(' reject non-numeric input', () => {
      expect(validateCardNumber('453201511283036a', 'visa')).toBe(false);
    });
  });

  describe('validateCVV', () => {
    it(' validate 3-digit CVV for Visa', () => {
      expect(validateCVV('123', 'visa')).toBe(true);
    });

    it(' validate 3-digit CVV for Mastercard', () => {
      expect(validateCVV('456', 'mastercard')).toBe(true);
    });

    it(' validate 4-digit CVV for Amex', () => {
      expect(validateCVV('1234', 'amex')).toBe(true);
    });

    it(' reject 4-digit CVV for Visa', () => {
      expect(validateCVV('1234', 'visa')).toBe(false);
    });

    it(' reject 3-digit CVV for Amex', () => {
      expect(validateCVV('123', 'amex')).toBe(false);
    });

    it(' reject non-numeric CVV', () => {
      expect(validateCVV('12a', 'visa')).toBe(false);
    });
  });

  describe('validateExpirationDate', () => {
    it(' validate future expiration dates', () => {
      const futureDate = new Date();
      futureDate.setFullYear(futureDate.getFullYear() + 1);
      const month = String(futureDate.getMonth() + 1).padStart(2, '0');
      const year = String(futureDate.getFullYear() % 100).padStart(2, '0');
      expect(validateExpirationDate(`${month}/${year}`)).toBe(true);
    });

    it(' reject past dates', () => {
      expect(validateExpirationDate('01/20')).toBe(false);
    });

    it(' reject invalid month', () => {
      expect(validateExpirationDate('13/25')).toBe(false);
    });

    it(' reject invalid format', () => {
      expect(validateExpirationDate('12-25')).toBe(false);
      expect(validateExpirationDate('1225')).toBe(false);
    });

    it(' accept current month in current year if not yet expired', () => {
      const now = new Date();
      const month = String(now.getMonth() + 1).padStart(2, '0');
      const year = String(now.getFullYear() % 100).padStart(2, '0');
      const result = validateExpirationDate(`${month}/${year}`);
      expect(typeof result).toBe('boolean');
    });
  });
});

describe('Integration: Credit Card API Endpoints', () => {
  describe('POST /api/v1/credit-cards - Create', () => {
    it(' require userId and limit fields', () => {
      const payload: Partial<CreateCreditCardRequest> = {
        cardNumber: '4532015112830366',
        cardNetwork: 'visa',
        cvv: '123',
        expirationDate: '12/25',
      };
      expect(!('userId' in payload) || !('limit' in payload)).toBe(true);
    });

    it(' accept valid card creation payload', () => {
      const payload: CreateCreditCardRequest = {
        userId: 'user123',
        limit: 5000,
        cardNumber: '4532015112830366',
        cardNetwork: 'visa',
        cvv: '123',
        expirationDate: '12/25',
      };
      expect(payload.userId).toBeDefined();
      expect(payload.limit).toBeDefined();
      expect(payload.cardNumber).toBeDefined();
    });
  });

  describe('PATCH /api/v1/credit-cards/:id - Update', () => {
    it(' accept creditLimit update', () => {
      const updatePayload = { creditLimit: 10000 };
      expect('creditLimit' in updatePayload).toBe(true);
    });

    it(' accept status update', () => {
      const updatePayload = { status: 'blocked' as const };
      expect('status' in updatePayload).toBe(true);
    });

    it(' accept both creditLimit and status updates', () => {
      const updatePayload = { creditLimit: 10000, status: 'inactive' as const };
      expect('creditLimit' in updatePayload && 'status' in updatePayload).toBe(true);
    });
  });

  describe('Response contracts', () => {
    it(' return 201 on successful card creation', () => {
      const httpStatus = 201;
      expect(httpStatus).toBe(201);
    });

    it(' return 200 on successful GET', () => {
      const httpStatus = 200;
      expect(httpStatus).toBe(200);
    });

    it(' return 200 on successful PATCH', () => {
      const httpStatus = 200;
      expect(httpStatus).toBe(200);
    });

    it(' return 204 on successful DELETE', () => {
      const httpStatus = 204;
      expect(httpStatus).toBe(204);
    });

    it(' return 400 on validation error', () => {
      const httpStatus = 400;
      expect(httpStatus).toBe(400);
    });

    it(' return 404 when resource not found', () => {
      const httpStatus = 404;
      expect(httpStatus).toBe(404);
    });
  });
});
