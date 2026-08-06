export interface MerchantTerminal {
  id: string;
  merchantId: string;
  serialNumber: string;
  model?: string | null;
  manufacturer?: string | null;
  firmwareVersion?: string | null;
  softwareVersion?: string | null;
  status?: string | null;
  location?: string | null;
  ipAddress?: string | null;
  macAddress?: string | null;
  lastHeartbeatAt?: string | null;
  lastBootAt?: string | null;
  lastTransactionAt?: string | null;
  batteryLevel?: number | null;
  storageUsed?: number | null;
  memoryUsed?: number | null;
  terminalGroupId?: string | null;
  isActive?: boolean;
  createdAt?: string;
  updatedAt?: string;
}

export interface MerchantTransaction {
  id: string;
  merchantId: string;
  terminalId?: string | null;
  customerId?: string | null;
  walletId?: string | null;
  amount: number | string;
  currency: string;
  status: string;
  type?: string | null;
  reference?: string | null;
  description?: string | null;
  paymentMethod?: string | null;
  cardBrand?: string | null;
  cardLastFour?: string | null;
  settlementStatus?: string | null;
  settlementAmount?: number | string | null;
  settlementCurrency?: string | null;
  settlementDate?: string | null;
  feeAmount?: number | string | null;
  feeCurrency?: string | null;
  netAmount?: number | string | null;
  paymentIntentId?: string | null;
  createdAt: string;
  updatedAt?: string;
}

export interface Merchant {
  id: string;
  name: string;
  legalName?: string | null;
  businessType?: string | null;
  registrationNumber?: string | null;
  taxId?: string | null;

  email?: string | null;
  phone?: string | null;
  website?: string | null;

  timezone?: string | null;
  currency?: string | null;
  status?: string | null;

  description?: string | null;
  logo?: string | null;

  contactEmail?: string | null;
  contactPhone?: string | null;

  addressLine1?: string | null;
  addressLine2?: string | null;
  city?: string | null;
  state?: string | null;
  postalCode?: string | null;
  country?: string | null;

  isVerified?: boolean;

  deletedAt?: string | null;
  createdAt: string;
  updatedAt?: string;

  users?: unknown[];
  terminals?: MerchantTerminal[];
  wallets?: unknown[];
  transactions?: MerchantTransaction[];
}

export interface MerchantListResponse {
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

export interface MerchantDetailResponse {
  success: boolean;
  data: Merchant;
}
