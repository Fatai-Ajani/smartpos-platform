"use client";

import { usePaymentIntents } from "@/features/payment-intents/hooks/use-payment-intents";
import type { PaymentIntent } from "@/features/payment-intents/types/payment-intent";

export function PaymentIntentsTable() {
  const {
    data,
    isLoading,
    isError,
  } = usePaymentIntents();

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-6 text-slate-600 shadow-sm">
        Loading payment intents...
      </div>
    );
  }

  if (isError) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6 text-red-700">
        Unable to load payment intents.
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
              Merchant
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Amount
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Description
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Status
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Created
            </th>
          </tr>
        </thead>

        <tbody className="divide-y divide-slate-200">
          {intents.length === 0 ? (
            <tr>
              <td
                colSpan={6}
                className="px-6 py-10 text-center text-sm text-slate-500"
              >
                No payment intents found.
              </td>
            </tr>
          ) : (
            intents.map((intent: PaymentIntent) => (
              <tr
                key={intent.id}
                className="transition-colors hover:bg-slate-50"
              >
                <td className="px-6 py-4 font-mono text-sm text-slate-700">
                  {intent.id.slice(0, 12)}...
                </td>

                <td className="px-6 py-4 text-sm font-medium text-slate-900">
                  {intent.merchant?.name ??
                    intent.merchantId ??
                    "-"}
                </td>

                <td className="px-6 py-4 text-sm font-semibold text-slate-900">
                  {intent.amount} {intent.currency}
                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {intent.description ?? "-"}
                </td>

                <td className="px-6 py-4">
                  <PaymentIntentStatus
                    status={intent.status}
                  />
                </td>

                <td className="px-6 py-4 text-sm text-slate-600">
                  {formatDate(intent.createdAt)}
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}

function PaymentIntentStatus({
  status,
}: {
  status: string;
}) {
  const normalizedStatus = status.toUpperCase();

  const statusStyles =
    normalizedStatus === "SUCCEEDED"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalizedStatus === "PENDING"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : normalizedStatus === "FAILED"
          ? "border-red-200 bg-red-50 text-red-700"
          : normalizedStatus === "CANCELED" ||
              normalizedStatus === "CANCELLED"
            ? "border-slate-200 bg-slate-100 text-slate-700"
            : "border-blue-200 bg-blue-50 text-blue-700";

  return (
    <span
      className={`inline-flex items-center rounded-full border px-3 py-1 text-xs font-semibold ${statusStyles}`}
    >
      {normalizedStatus}
    </span>
  );
}

function formatDate(value: string | undefined) {
  if (!value) {
    return "-";
  }

  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "-";
  }

  return date.toLocaleDateString();
}
