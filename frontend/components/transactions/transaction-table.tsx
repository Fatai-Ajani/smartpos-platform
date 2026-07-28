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

      <div className="overflow-x-auto">

        <table className="w-full">

          <thead className="border-b border-slate-200 bg-slate-50">

            <tr>

              <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                Reference
              </th>

              <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                Merchant
              </th>

              <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                Amount
              </th>

              <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                Type
              </th>

              <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                Payment Method
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
                  colSpan={7}
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

                    <td className="px-6 py-4">

                      <p className="text-sm font-semibold text-slate-900">
                        {transaction.reference ?? transaction.id.slice(0, 10)}
                      </p>

                      <p className="mt-1 font-mono text-xs text-slate-500">
                        {transaction.id.slice(0, 10)}...
                      </p>

                    </td>

                    <td className="px-6 py-4 text-sm font-medium text-slate-900">
                      {transaction.merchant?.name ??
                        transaction.merchantId ??
                        "-"}
                    </td>

                    <td className="px-6 py-4 text-sm font-semibold text-slate-900">
                      {transaction.amount} {transaction.currency}
                    </td>

                    <td className="px-6 py-4 text-sm text-slate-700">
                      {transaction.type ?? "-"}
                    </td>

                    <td className="px-6 py-4 text-sm text-slate-700">
                      {transaction.paymentMethod ?? "-"}
                    </td>

                    <td className="px-6 py-4">

                      <span
                        className={`inline-flex rounded-full border px-2.5 py-1 text-xs font-semibold ${
                          transaction.status === "SETTLED"
                            ? "border-emerald-200 bg-emerald-50 text-emerald-700"
                            : transaction.status === "FAILED"
                              ? "border-red-200 bg-red-50 text-red-700"
                              : transaction.status === "PENDING"
                                ? "border-amber-200 bg-amber-50 text-amber-700"
                                : "border-slate-200 bg-slate-100 text-slate-700"
                        }`}
                      >
                        {transaction.status}
                      </span>

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

    </div>
  );
}
