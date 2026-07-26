"use client";

import { usePaymentIntents } from "@/features/payment-intents/hooks/use-payment-intents";

export function PaymentIntentsTable() {
  const {
    data,
    isLoading,
  } = usePaymentIntents();

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-6 text-slate-600 shadow-sm">
        Loading payment intents...
      </div>
    );
  }

  const intents = data ?? [];

  return (
    <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
      <table className="w-full">
        <thead className="border-b border-slate-200 bg-slate-50">
          <tr>
            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              ID
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Amount
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Currency
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Status
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Merchant
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Created
            </th>
          </tr>
        </thead>

        <tbody>
          {intents.length === 0 ? (
            <tr>
              <td
                colSpan={6}
                className="px-6 py-10 text-center text-slate-500"
              >
                No payment intents found.
              </td>
            </tr>
          ) : (
            intents.map((intent) => (
              <tr
                key={intent.id}
                className="border-b border-slate-100 transition hover:bg-slate-50"
              >
                <td className="px-6 py-4 font-mono text-sm text-slate-700">
                  {intent.id.slice(0, 10)}
                </td>

                <td className="px-6 py-4 text-sm font-medium text-slate-900">
                  {intent.amount}
                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {intent.currency}
                </td>

                <td className="px-6 py-4 text-sm font-medium text-slate-700">
                  {intent.status}
                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {intent.merchant?.name ?? "-"}
                </td>

                <td className="px-6 py-4 text-sm text-slate-600">
                  {intent.createdAt
                    ? new Date(intent.createdAt).toLocaleDateString()
                    : "-"}
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}
