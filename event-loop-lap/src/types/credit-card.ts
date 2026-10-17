export type CardNetwork = 'visa' | 'mastercard' | 'amex' | 'discover';
export type CardStatus = 'active' | 'inactive' | 'blocked';

export interface CreditCard {
  id: string;
  userId: string;
  cardNumber: string;
  cardNetwork: CardNetwork;
  cvv: string;
  expirationDate: string; 
  creditLimit: number;
  status: CardStatus;
  isDeleted: boolean;
  createdAt: Date;
  updatedAt: Date;
}

export interface CreateCreditCardRequest {
  userId: string;
  cardNumber: string;
  cardNetwork: CardNetwork;
  cvv: string;
  expirationDate: string;
  limit: number;
}

export interface UpdateCreditCardRequest {
  creditLimit?: number;
  status?: CardStatus;
}

export interface CreditCardResponse {
  id: string;
  userId: string;
  cardNumber: string;
  cardNetwork: CardNetwork;
  cvv: string;
  expirationDate: string;
  creditLimit: number;
  status: CardStatus;
  createdAt: Date;
  updatedAt: Date;
}
