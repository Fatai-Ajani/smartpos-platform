export interface MerchantTerminal {
  id: string;
  serialNumber: string;
  manufacturer?: string | null;
  model?: string | null;
  status: string;
}

export interface Merchant {
  id: string;
  name: string;
  legalName?: string | null;
  businessType?: string | null;
  email: string;
  phone?: string | null;
  status: string;
  currency: string;
  isVerified: boolean;
  createdAt: string;
  terminals?: MerchantTerminal[];
}

export interface MerchantResponse {
  success: boolean;

  data: {
    items: Merchant[];

    pagination: {
      page: number;
      limit: number;
      total: number;
      pages: number;
    };
  };
}
