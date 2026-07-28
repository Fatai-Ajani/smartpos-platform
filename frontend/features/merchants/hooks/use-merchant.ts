"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";
import type { Merchant } from "../types/merchant";

interface MerchantResponse {
  success: boolean;
  data: Merchant;
}

export function useMerchant(id: string) {
  return useQuery({
    queryKey: ["merchant", id],

    queryFn: async (): Promise<Merchant> => {
      const response = await api.get<MerchantResponse>(
        ENDPOINTS.merchants.detail(id)
      );

      return response.data.data;
    },

    enabled: Boolean(id),
  });
}
