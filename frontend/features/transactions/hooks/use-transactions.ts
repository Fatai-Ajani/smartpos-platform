"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type { Transaction } from "@/features/transactions/types/transaction";

interface TransactionListResponse {
  success: boolean;
  data: {
    items: Transaction[];
    pagination: {
      page: number;
      limit: number;
      total: number;
      pages: number;
    };
  };
}

async function getTransactions(): Promise<Transaction[]> {
  const response = await api.get<TransactionListResponse>(
    ENDPOINTS.transactions.list
  );

  return response.data.data.items;
}

export function useTransactions() {
  return useQuery({
    queryKey: ["transactions"],
    queryFn: getTransactions,
  });
}

export type { Transaction };
