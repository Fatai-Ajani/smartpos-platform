import { api } from "@/lib/api/client";

import type {
  TransactionResponse,
} from "../types/transaction";

export async function getTransactions(
  page = 1,
  limit = 10
): Promise<TransactionResponse["data"]> {

  const { data } =
    await api.get<TransactionResponse>(
      `/transactions?page=${page}&limit=${limit}`
    );

  return data.data;
}