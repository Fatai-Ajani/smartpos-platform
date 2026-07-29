"use client";

import { useQuery } from "@tanstack/react-query";

import { getPaymentIntents } from "@/features/payment-intents/services/payment-intent.service";

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
