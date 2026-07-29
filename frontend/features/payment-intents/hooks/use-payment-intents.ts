"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type {
  PaymentIntent,
  PaymentIntentResponse,
} from "@/features/payment-intents/types/payment-intent";

async function getPaymentIntents(
  page: number,
  limit: number
): Promise<PaymentIntentResponse["data"]> {
  const response = await api.get<PaymentIntentResponse>(
    ENDPOINTS.paymentIntents.list,
    {
      params: {
        page,
        limit,
      },
    }
  );

  return response.data.data;
}

export function usePaymentIntents(
  page = 1,
  limit = 10
) {
  return useQuery({
    queryKey: [
      "payment-intents",
      page,
      limit,
    ],
    queryFn: () =>
      getPaymentIntents(
        page,
        limit
      ),
  });
}

async function getPaymentIntent(
  id: string
): Promise<PaymentIntent> {
  const response = await api.get<{
    success: boolean;
    data: PaymentIntent;
  }>(
    ENDPOINTS.paymentIntents.detail(id)
  );

  return response.data.data;
}

export function usePaymentIntent(
  id: string
) {
  return useQuery({
    queryKey: [
      "payment-intent",
      id,
    ],
    queryFn: () =>
      getPaymentIntent(id),
    enabled: Boolean(id),
  });
}

export type {
  PaymentIntent,
};
