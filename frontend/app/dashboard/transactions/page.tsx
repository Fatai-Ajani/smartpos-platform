"use client";

import { useTransactions } from "@/features/transactions/hooks/use-transactions";
import type { Transaction } from "@/features/transactions/types/transaction";

export default function TransactionsPage() {

  const {
    data,
    isLoading,
    error,
  } = useTransactions();

  if (isLoading) {
    return (
      <div className="p-8">
        Loading transactions...
      </div>
    );
  }

  if (error) {
    return (
      <div className="p-8 text-red-600">
        Failed to load transactions.
      </div>
    );
  }

  return (
    <div className="p-8">

      <h1 className="mb-6 text-3xl font-bold text-slate-900">
        Transactions
      </h1>

      <div className="overflow-hidden rounded-xl border bg-white shadow-sm">

        <table className="w-full">

          <thead className="bg-slate-100">

            <tr>

              <th className="p-4 text-left">
                ID
              </th>

              <th className="p-4 text-left">
                Merchant
              </th>

              <th className="p-4 text-left">
                Amount
              </th>

              <th className="p-4 text-left">
                Currency
              </th>

              <th className="p-4 text-left">
                Status
              </th>

              <th className="p-4 text-left">
                Payment Method
              </th>

              <th className="p-4 text-left">
                Created
              </th>

            </tr>

          </thead>

          <tbody>

            {data?.items.length === 0 ? (

              <tr>

                <td
                  colSpan={7}
                  className="p-12 text-center text-slate-500"
                >
                  No transactions found.
                </td>

              </tr>

            ) : (

              data?.items.map((transaction: Transaction) => (

                <tr
                  key={transaction.id}
                  className="border-t hover:bg-slate-50"
                >

                  <td className="p-4 font-mono text-sm">
                    {transaction.id.slice(0, 10)}
                  </td>

                  <td className="p-4">
                    {transaction.merchant?.name ?? "-"}
                  </td>

                  <td className="p-4">
                    {transaction.amount}
                  </td>

                  <td className="p-4">
                    {transaction.currency}
                  </td>

                  <td className="p-4">
                    {transaction.status}
                  </td>

                  <td className="p-4">
                    {transaction.paymentMethod}
                  </td>

                  <td className="p-4">
                    {new Date(
                      transaction.createdAt
                    ).toLocaleString()}
                  </td>

                </tr>

              ))

            )}

          </tbody>

        </table>

      </div>

    </div>
  );

}