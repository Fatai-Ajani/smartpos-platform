"use client";

import { useMutation, useQuery } from "@tanstack/react-query";

import {
  getTransactions,
  startTransaction,
  executePayment,
} from "@/features/transactions/services/transaction.service";

export function useTransactions(
  page = 1,
  limit = 10
) {
  return useQuery({
    queryKey: ["transactions", page, limit],
    queryFn: () => getTransactions(page, limit),
  });
}


export function useStartTransaction() {

  return useMutation({

    mutationFn:
      startTransaction,

  });

}

export function useExecutePayment() {

  return useMutation({

    mutationFn:
      executePayment,

  });

}
