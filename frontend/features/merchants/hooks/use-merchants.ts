"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";
import type { Merchant } from "../types/merchant";

interface MerchantListResponse {
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

async function getMerchants(): Promise<Merchant[]> {
  const response = await api.get<MerchantListResponse>(
    ENDPOINTS.merchants.list
  );

  return response.data.data.items;
}

export function useMerchants() {
  return useQuery({
    queryKey: ["merchants"],
    queryFn: getMerchants,
  });
}
