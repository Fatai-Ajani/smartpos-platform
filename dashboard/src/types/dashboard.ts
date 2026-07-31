export interface DashboardMetrics {
  revenue: number;
  transactionsToday: number;
  totalMerchants: number;
  activeTerminals: number;
  terminalCoverage: number;

  platformActivity: {
    date: string;
    totalTransactions: number;
    hourly: {
      hour: number;
      transactions: number;
    }[];
  };

  merchantInfrastructure: {
    registeredMerchants: number;
    activeTerminals: number;
    terminalCoverage: number;
  };

  revenueSummary: {
    date: string;
    revenue: number;
    currency: string;
  };

  transactionStatusBreakdown: {
    status: string;
    count: number;
  }[];
}
