"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type {
  PaymentIntent,
  PaymentIntentResponse,
} from "@/features/payment-intents/types/payment-intent";

async function getPaymentIntents(): Promise<PaymentIntent[]> {
  const response = await api.get<PaymentIntentResponse>(
    ENDPOINTS.paymentIntents.list
  );

  return response.data.data.items;
}

export function usePaymentIntents() {
  return useQuery({
    queryKey: ["payment-intents"],
    queryFn: getPaymentIntents,
  });
}
