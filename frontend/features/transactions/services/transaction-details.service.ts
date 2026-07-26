import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type { Transaction } from "@/features/transactions/types/transaction";

interface TransactionDetailResponse {
  success: boolean;
  data: Transaction;
}

export async function getTransaction(
  id: string
): Promise<Transaction> {
  const response = await api.get<TransactionDetailResponse>(
    ENDPOINTS.transactions.detail(id)
  );

  return response.data.data;
}
