import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type {
  Merchant,
  MerchantDetailResponse,
  MerchantListResponse,
} from "../types/merchant";

export async function getMerchants(
  page = 1,
  limit = 10
): Promise<MerchantListResponse["data"]> {
  const response = await api.get<MerchantListResponse>(
    ENDPOINTS.merchants.list,
    {
      params: {
        page,
        limit,
      },
    }
  );

  return response.data.data;
}

export async function getMerchant(
  id: string
): Promise<Merchant> {
  const response = await api.get<MerchantDetailResponse>(
    ENDPOINTS.merchants.detail(id)
  );

  return response.data.data;
}
