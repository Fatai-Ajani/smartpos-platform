import { api } from "@/lib/api/client";
import { ENDPOINTS } from "@/lib/api/endpoints";

import type {
  Transaction,
  TransactionListResponse,
} from "../types/transaction";

export async function getTransactions(
  page = 1,
  limit = 10
): Promise<TransactionListResponse["data"]> {
  const response = await api.get<TransactionListResponse>(
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

export async function getTransaction(
  id: string
): Promise<Transaction> {
  const response = await api.get<{
    success: boolean;
    data: Transaction;
  }>(
    ENDPOINTS.transactions.detail(id)
  );

  return response.data.data;
}


/*
|--------------------------------------------------------------------------
| Start Transaction
|--------------------------------------------------------------------------
*/

export async function startTransaction(
  payload: any
) {

  const response =
    await api.post(
      "/transactions/start",
      payload
    );

  return response.data.data;

}

/*
|--------------------------------------------------------------------------
| Execute Payment
|--------------------------------------------------------------------------
*/

export async function executePayment(
  payload: {
    transactionId: string;
    fromCurrency: string;
    toCurrency: string;
  }
) {

  const response =
    await api.post(
      "/transactions/execute",
      payload
    );

  return response.data.data;

}
