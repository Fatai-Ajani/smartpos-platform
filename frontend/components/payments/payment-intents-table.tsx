"use client";

import Link from "next/link";
import {
  ChevronLeft,
  ChevronRight,
  Eye,
} from "lucide-react";

import { usePaymentIntents } from "@/features/payment-intents/hooks/use-payment-intents";
import type { PaymentIntent } from "@/features/payment-intents/types/payment-intent";

interface PaymentIntentsTableProps {
  page?: number;
  onPageChange?: (page: number) => void;
}

export function PaymentIntentsTable({
  page = 1,
  onPageChange,
}: PaymentIntentsTableProps) {
  const limit = 10;

  const {
    data,
    isLoading,
    isError,
  } = usePaymentIntents(
    page,
    limit
  );

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-center text-sm text-slate-500 shadow-sm">
        Loading payment intents...
      </div>
    );
  }

  if (isError) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6 text-sm text-red-700">
        Unable to load payment intents.
      </div>
    );
  }

  const intents =
    data?.items ?? [];

  const pagination =
    data?.pagination;

  const currentPage =
    pagination?.page ?? page;

  const totalPages =
    pagination?.pages ?? 1;

  return (
    <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">

      <div className="overflow-x-auto">
        <table className="w-full min-w-[900px]">

          <thead className="border-b border-slate-200 bg-slate-50">
            <tr>
              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Payment Intent
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Merchant
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Amount
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Description
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Status
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Created
              </th>

              <th className="px-6 py-4 text-right text-xs font-semibold uppercase tracking-wide text-slate-500">
                Action
              </th>
            </tr>
          </thead>

          <tbody className="divide-y divide-slate-200">

            {intents.length === 0 ? (
              <tr>
                <td
                  colSpan={7}
                  className="px-6 py-12 text-center text-sm text-slate-500"
                >
                  No payment intents found.
                </td>
              </tr>
            ) : (
              intents.map(
                (
                  intent: PaymentIntent
                ) => (
                  <tr
                    key={intent.id}
                    className="transition-colors hover:bg-slate-50"
                  >

                    <td className="px-6 py-5">
                      <div>
                        <p className="font-mono text-sm font-medium text-slate-900">
                          {intent.id.slice(
                            0,
                            14
                          )}
                          ...
                        </p>

                        <p className="mt-1 text-xs text-slate-400">
                          {intent.id}
                        </p>
                      </div>
                    </td>

                    <td className="px-6 py-5">
                      <p className="text-sm font-medium text-slate-900">
                        {intent.merchant?.name ??
                          intent.merchantId ??
                          "-"}
                      </p>

                      {intent.merchant?.id && (
                        <p className="mt-1 font-mono text-xs text-slate-400">
                          {intent.merchant.id.slice(
                            0,
                            12
                          )}
                          ...
                        </p>
                      )}
                    </td>

                    <td className="px-6 py-5">
                      <p className="text-sm font-semibold text-slate-900">
                        {formatAmount(
                          intent.amount,
                          intent.currency
                        )}
                      </p>
                    </td>

                    <td className="max-w-[220px] px-6 py-5">
                      <p className="truncate text-sm text-slate-700">
                        {intent.description ??
                          "-"}
                      </p>
                    </td>

                    <td className="px-6 py-5">
                      <PaymentIntentStatus
                        status={
                          intent.status
                        }
                      />
                    </td>

                    <td className="px-6 py-5 text-sm text-slate-600">
                      {formatDate(
                        intent.createdAt
                      )}
                    </td>

                    <td className="px-6 py-5 text-right">
                      <Link
                        href={`/dashboard/payment-intents/${intent.id}`}
                        className="inline-flex items-center gap-2 rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 transition hover:border-slate-300 hover:bg-slate-50"
                      >
                        <Eye size={15} />
                        View
                      </Link>
                    </td>

                  </tr>
                )
              )
            )}

          </tbody>

        </table>
      </div>

      <div className="flex flex-col gap-4 border-t border-slate-200 px-6 py-4 sm:flex-row sm:items-center sm:justify-between">

        <p className="text-sm text-slate-500">
          Showing{" "}
          {intents.length}{" "}
          of{" "}
          {pagination?.total ?? 0}{" "}
          payment intents
        </p>

        <div className="flex items-center gap-2">

          <button
            type="button"
            disabled={
              currentPage <= 1
            }
            onClick={() =>
              onPageChange?.(
                currentPage - 1
              )
            }
            className="inline-flex items-center gap-1 rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-40"
          >
            <ChevronLeft
              size={16}
            />
            Previous
          </button>

          <span className="px-3 text-sm text-slate-600">
            Page{" "}
            {currentPage}{" "}
            of{" "}
            {totalPages}
          </span>

          <button
            type="button"
            disabled={
              currentPage >=
              totalPages
            }
            onClick={() =>
              onPageChange?.(
                currentPage + 1
              )
            }
            className="inline-flex items-center gap-1 rounded-lg border border-slate-200 px-3 py-2 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-40"
          >
            Next
            <ChevronRight
              size={16}
            />
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
  const normalized =
    status.toUpperCase();

  const styles =
    normalized === "SUCCEEDED"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalized === "PENDING"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : normalized === "FAILED"
          ? "border-red-200 bg-red-50 text-red-700"
          : normalized === "CANCELED" ||
              normalized === "CANCELLED"
            ? "border-slate-200 bg-slate-100 text-slate-700"
            : "border-blue-200 bg-blue-50 text-blue-700";

  return (
    <span
      className={`inline-flex rounded-full border px-3 py-1 text-xs font-semibold ${styles}`}
    >
      {normalized}
    </span>
  );
}

function formatAmount(
  amount: number | string,
  currency: string
) {
  const value =
    Number(amount);

  if (
    Number.isNaN(value)
  ) {
    return `${amount} ${currency}`;
  }

  return new Intl.NumberFormat(
    "en-US",
    {
      style: "currency",
      currency,
    }
  ).format(value);
}

function formatDate(
  value: string | undefined
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

  return date.toLocaleString(
    "en-US",
    {
      dateStyle: "medium",
      timeStyle: "short",
    }
  );
}
