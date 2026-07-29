"use client";

import Link from "next/link";

import { usePaymentIntents } from "@/features/payment-intents/hooks/use-payment-intents";
import type { PaymentIntent } from "@/features/payment-intents/types/payment-intent";

interface PaymentIntentsTableProps {
  page: number;
  onPageChange: (page: number) => void;
}

export function PaymentIntentsTable({
  page,
  onPageChange,
}: PaymentIntentsTableProps) {
  const {
    data,
    isLoading,
    isError,
    isFetching,
  } = usePaymentIntents(
    page,
    10
  );

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

  const intents: PaymentIntent[] =
    data?.items ?? [];

  const pagination =
    data?.pagination;

  const totalPages =
    pagination?.pages ?? 1;

  return (
    <div className="space-y-4">
      <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="overflow-x-auto">
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
                intents.map(
                  (intent) => (
                    <tr
                      key={intent.id}
                      className="transition-colors hover:bg-slate-50"
                    >
                      <td className="px-6 py-4">
                        <Link
                          href={`/dashboard/payment-intents/${intent.id}`}
                          className="font-mono text-sm font-medium text-blue-600 hover:text-blue-800 hover:underline"
                        >
                          {intent.id.slice(
                            0,
                            12
                          )}
                          ...
                        </Link>
                      </td>

                      <td className="px-6 py-4 text-sm font-medium text-slate-900">
                        {intent.merchant?.name ??
                          intent.merchantId ??
                          "-"}
                      </td>

                      <td className="px-6 py-4 text-sm font-semibold text-slate-900">
                        {formatAmount(
                          intent.amount,
                          intent.currency
                        )}
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-700">
                        {intent.description ??
                          "-"}
                      </td>

                      <td className="px-6 py-4">
                        <PaymentIntentStatus
                          status={
                            intent.status
                          }
                        />
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-600">
                        {formatDate(
                          intent.createdAt
                        )}
                      </td>
                    </tr>
                  )
                )
              )}
            </tbody>
          </table>
        </div>
      </div>

      <div className="flex flex-col gap-4 rounded-xl border border-slate-200 bg-white px-6 py-4 shadow-sm sm:flex-row sm:items-center sm:justify-between">
        <div className="text-sm text-slate-500">
          Showing{" "}
          <span className="font-medium text-slate-700">
            {intents.length}
          </span>{" "}
          of{" "}
          <span className="font-medium text-slate-700">
            {pagination?.total ?? 0}
          </span>{" "}
          payment intents
        </div>

        <div className="flex items-center gap-2">
          <button
            type="button"
            disabled={
              page <= 1 ||
              isFetching
            }
            onClick={() =>
              onPageChange(
                Math.max(
                  1,
                  page - 1
                )
              )
            }
            className="rounded-lg border border-slate-200 bg-white px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-50"
          >
            Previous
          </button>

          <span className="px-3 text-sm text-slate-600">
            Page {page} of{" "}
            {totalPages}
          </span>

          <button
            type="button"
            disabled={
              page >= totalPages ||
              isFetching
            }
            onClick={() =>
              onPageChange(
                Math.min(
                  totalPages,
                  page + 1
                )
              )
            }
            className="rounded-lg border border-slate-200 bg-white px-4 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-50"
          >
            Next
          </button>
        </div>
      </div>
    </div>
  );
}

function PaymentIntentStatus({
  status,
}: {
  status: string;
}) {
  const normalizedStatus =
    status.toUpperCase();

  const statusStyles =
    normalizedStatus ===
      "SUCCEEDED"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalizedStatus ===
          "PENDING"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : normalizedStatus ===
            "FAILED"
          ? "border-red-200 bg-red-50 text-red-700"
          : normalizedStatus ===
                "CANCELED" ||
              normalizedStatus ===
                "CANCELLED"
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

function formatAmount(
  amount: number | string,
  currency: string
) {
  const numericAmount =
    Number(amount);

  if (
    Number.isNaN(
      numericAmount
    )
  ) {
    return `${amount} ${currency}`;
  }

  try {
    return new Intl.NumberFormat(
      "en-US",
      {
        style: "currency",
        currency,
        maximumFractionDigits: 2,
      }
    ).format(
      numericAmount
    );
  } catch {
    return `${numericAmount.toLocaleString()} ${currency}`;
  }
}

function formatDate(
  value:
    | string
    | null
    | undefined
) {
  if (!value) {
    return "-";
  }

  const date =
    new Date(value);

  if (
    Number.isNaN(
      date.getTime()
    )
  ) {
    return "-";
  }

  return date.toLocaleString();
}
