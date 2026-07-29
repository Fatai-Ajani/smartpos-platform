"use client";

import { useQuery } from "@tanstack/react-query";

import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type {
  Transaction,
  TransactionListResponse,
} from "@/features/transactions/types/transaction";

async function getTransactions(
  page: number,
  limit: number
): Promise<TransactionListResponse["data"]> {
  const response =
    await api.get<TransactionListResponse>(
      ENDPOINTS.transactions.list,
      {
        params: {
          page,
          limit,
        },
      }
    );

  return response.data.data;
}

export function useTransactions(
  page = 1,
  limit = 10
) {
  return useQuery({
    queryKey: [
      "transactions",
      page,
      limit,
    ],

    queryFn: () =>
      getTransactions(
        page,
        limit
      ),
  });
}

export type { Transaction };