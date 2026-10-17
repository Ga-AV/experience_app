import type { CardNetwork } from '../types/credit-card';

interface CardNetworkRules {
  prefixes: (string | { start: number; end: number })[];
  cvvLength: number;
}

const CARD_RULES: Record<CardNetwork, CardNetworkRules> = {
  visa: {
    prefixes: ['4'],
    cvvLength: 3,
  },
  mastercard: {
    prefixes: [
      { start: 51, end: 55 },
      { start: 2221, end: 2720 },
    ],
    cvvLength: 3,
  },
  amex: {
    prefixes: ['34', '37'],
    cvvLength: 4,
  },
  discover: {
    prefixes: ['6011', '65', { start: 644, end: 649 }],
    cvvLength: 3,
  },
};

export function validateCardNumber(
  cardNumber: string,
  network: CardNetwork
): boolean {
  const cleaned = cardNumber.replace(/\s+/g, '');

  if (!/^\d+$/.test(cleaned)) {
    return false;
  }

  const rules = CARD_RULES[network];
  let isValidPrefix = false;

  for (const prefix of rules.prefixes) {
    if (typeof prefix === 'string') {
      if (cleaned.startsWith(prefix)) {
        isValidPrefix = true;
        break;
      }
    } else {
      const numPrefix = parseInt(cleaned.substring(0, String(prefix.start).length));
      if (numPrefix >= prefix.start && numPrefix <= prefix.end) {
        isValidPrefix = true;
        break;
      }
    }
  }

  return isValidPrefix && luhnCheck(cleaned);
}

export function validateCVV(cvv: string, network: CardNetwork): boolean {
  const rules = CARD_RULES[network];
  return /^\d+$/.test(cvv) && cvv.length === rules.cvvLength;
}

export function validateExpirationDate(expiration: string): boolean {
  const match = expiration.match(/^(\d{2})\/(\d{2})$/);
  if (!match) return false;

  const month = parseInt(match[1], 10);
  const year = parseInt(match[2], 10);

  if (month < 1 || month > 12) return false;

  const now = new Date();
  const currentYear = now.getFullYear() % 100;
  const currentMonth = now.getMonth() + 1;

  if (year < currentYear) return false;
  if (year === currentYear && month < currentMonth) return false;

  return true;
}

function luhnCheck(cardNumber: string): boolean {
  let sum = 0;
  let isEven = false;

  for (let i = cardNumber.length - 1; i >= 0; i--) {
    let digit = parseInt(cardNumber.charAt(i), 10);

    if (isEven) {
      digit *= 2;
      if (digit > 9) {
        digit -= 9;
      }
    }

    sum += digit;
    isEven = !isEven;
  }

  return sum % 10 === 0;
}
