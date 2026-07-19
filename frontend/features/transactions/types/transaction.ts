export interface Transaction {
  id: string;
  amount: number;
  currency: string;
  status: string;
  paymentMethod: string;
  createdAt: string;

  merchant?: {
    name: string;
  };

  terminal?: {
    serialNumber: string;
  };
}

export interface TransactionResponse {
  success: boolean;

  data: {
    items: Transaction[];

    pagination: {
      page: number;
      limit: number;
      total: number;
      pages: number;
    };
  };
}