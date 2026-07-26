"use client";

import { useRouter } from "next/navigation";

import { useTransactions } from "@/features/transactions/hooks/use-transactions";
import type { Transaction } from "@/features/transactions/types/transaction";

export function TransactionTable() {
  const router = useRouter();

  const {
    data,
    isLoading,
  } = useTransactions();

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-6 text-slate-600">
        Loading transactions...
      </div>
    );
  }

  const transactions = data ?? [];

  return (
    <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">

      <table className="w-full">

        <thead className="border-b border-slate-200 bg-slate-50">

          <tr>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              ID
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Merchant
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Amount
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Status
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Date
            </th>

          </tr>

        </thead>

        <tbody className="divide-y divide-slate-200">

          {transactions.length === 0 ? (

            <tr>

              <td
                colSpan={5}
                className="px-6 py-10 text-center text-sm text-slate-500"
              >
                No transactions found.
              </td>

            </tr>

          ) : (

            transactions.map(
              (transaction: Transaction) => (

                <tr
                  key={transaction.id}
                  onClick={() =>
                    router.push(
                      `/dashboard/transactions/${transaction.id}`
                    )
                  }
                  className="cursor-pointer transition-colors hover:bg-slate-50"
                >

                  <td className="px-6 py-4 font-mono text-sm text-slate-700">
                    {transaction.id.slice(0, 10)}
                  </td>

                  <td className="px-6 py-4 text-sm font-medium text-slate-900">
                    {transaction.merchantId ?? "-"}
                  </td>

                  <td className="px-6 py-4 text-sm font-medium text-slate-900">
                    {transaction.amount} {transaction.currency}
                  </td>

                  <td className="px-6 py-4 text-sm font-medium text-slate-900">
                    {transaction.status}
                  </td>

                  <td className="px-6 py-4 text-sm text-slate-600">
                    {new Date(
                      transaction.createdAt
                    ).toLocaleDateString()}
                  </td>

                </tr>

              )
            )

          )}

        </tbody>

      </table>

    </div>
  );
}
