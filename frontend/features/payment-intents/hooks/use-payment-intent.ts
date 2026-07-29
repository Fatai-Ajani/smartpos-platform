"use client";

import { useQuery } from "@tanstack/react-query";

import { getPaymentIntent } from "@/features/payment-intents/services/payment-intent.service";

export function usePaymentIntent(id: string) {
  return useQuery({
    queryKey: ["payment-intent", id],
    queryFn: () => getPaymentIntent(id),
    enabled: Boolean(id),
  });
}
