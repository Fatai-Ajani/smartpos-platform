export interface PaymentIntentMerchant {
  id: string;
  name: string;
}

export interface PaymentIntentCustomer {
  id?: string | null;
  firstName?: string | null;
  lastName?: string | null;
  email?: string | null;
}

export interface PaymentIntent {
  id: string;

  merchantId?: string | null;
  customerId?: string | null;
  paymentMethodId?: string | null;

  amount: number | string;
  currency: string;
  status: string;

  description?: string | null;
  clientSecret?: string | null;
  metadata?: unknown;

  createdAt: string;
  updatedAt?: string;
  expiresAt?: string | null;

  merchant?: PaymentIntentMerchant | null;
  customer?: PaymentIntentCustomer | null;
}

export interface PaymentIntentResponse {
  success: boolean;

  data: {
    items: PaymentIntent[];

    pagination: {
      page: number;
      limit: number;
      total: number;
      pages: number;
    };
  };
}
