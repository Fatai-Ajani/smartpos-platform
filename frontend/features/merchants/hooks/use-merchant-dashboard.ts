"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

export interface MerchantDashboard {
  terminals: number;
  wallets: number;
  customers: number;
  transactions: number;
  settlements: number;
}

interface MerchantDashboardResponse {
  success: boolean;
  data: MerchantDashboard;
}

export function useMerchantDashboard(id: string) {
  return useQuery({
    queryKey: ["merchant", id, "dashboard"],

    queryFn: async (): Promise<MerchantDashboard> => {
      const response = await api.get<MerchantDashboardResponse>(
        ENDPOINTS.merchants.dashboard(id)
      );

      return response.data.data;
    },

    enabled: Boolean(id),
  });
}
