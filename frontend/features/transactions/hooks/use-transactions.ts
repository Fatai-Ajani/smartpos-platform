"use client";

import { useQuery } from "@tanstack/react-query";

import { getTransactions } from "@/features/transactions/services/transaction.service";

export function useTransactions(
  page = 1,
  limit = 10
) {
  return useQuery({
    queryKey: ["transactions", page, limit],
    queryFn: () => getTransactions(page, limit),
  });
}
