"use client";

import Link from "next/link";
import { ArrowLeft } from "lucide-react";
import { useParams } from "next/navigation";

import { usePaymentIntent } from "@/features/payment-intents/hooks/use-payment-intent";

interface PaymentAttempt {
  id: string;
  status?: string | null;
  createdAt?: string | null;
}

interface PaymentIntentTransaction {
  id: string;
  reference?: string | null;
  amount: number | string;
  currency: string;
  type?: string | null;
  paymentMethod?: string | null;
  status: string;
  createdAt: string;
}

export default function PaymentIntentDetailPage() {
  const params = useParams();

  const id = String(params.id);

  const {
    data: intent,
    isLoading,
    isError,
  } = usePaymentIntent(id);

  if (isLoading) {
    return (
      <div className="space-y-6">
        <Link
          href="/dashboard/payment-intents"
          className="inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft size={16} />
          Back to Payment Intents
        </Link>

        <div className="rounded-xl border border-slate-200 bg-white p-8 text-slate-600 shadow-sm">
          Loading payment intent...
        </div>
      </div>
    );
  }

  if (isError || !intent) {
    return (
      <div className="space-y-6">
        <Link
          href="/dashboard/payment-intents"
          className="inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft size={16} />
          Back to Payment Intents
        </Link>

        <div className="rounded-xl border border-red-200 bg-red-50 p-8 text-red-700">
          Unable to load this payment intent.
        </div>
      </div>
    );
  }

  const transactions =
    (intent.transactions ?? []) as PaymentIntentTransaction[];

  const paymentAttempts =
    (intent.paymentAttempts ?? []) as PaymentAttempt[];

  return (
    <div className="space-y-8">
      <div>
        <Link
          href="/dashboard/payment-intents"
          className="mb-5 inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft size={16} />
          Back to Payment Intents
        </Link>

        <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
          <div>
            <div className="flex flex-wrap items-center gap-3">
              <h1 className="text-3xl font-bold tracking-tight text-slate-900">
                Payment Intent
              </h1>

              <PaymentIntentStatus
                status={intent.status}
              />
            </div>

            <p className="mt-2 break-all font-mono text-sm text-slate-500">
              {intent.id}
            </p>
          </div>

          <div className="rounded-lg border border-slate-200 bg-white px-4 py-3 shadow-sm">
            <p className="text-xs font-medium uppercase tracking-wide text-slate-500">
              Created
            </p>

            <p className="mt-1 text-sm font-semibold text-slate-900">
              {formatDate(intent.createdAt)}
            </p>
          </div>
        </div>
      </div>

      <div className="grid gap-5 md:grid-cols-3">
        <SummaryCard
          label="Amount"
          value={formatAmount(
            intent.amount,
            intent.currency
          )}
        />

        <SummaryCard
          label="Merchant"
          value={
            intent.merchant?.name ??
            intent.merchantId ??
            "-"
          }
        />

        <SummaryCard
          label="Description"
          value={intent.description ?? "-"}
        />
      </div>

      <section className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Payment Intent Information
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Core information associated with this payment request.
          </p>
        </div>

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">
          <InfoItem
            label="Payment Intent ID"
            value={intent.id}
          />

          <InfoItem
            label="Merchant"
            value={
              intent.merchant?.name ??
              intent.merchantId ??
              "-"
            }
          />

          <InfoItem
            label="Customer ID"
            value={intent.customerId ?? "-"}
          />

          <InfoItem
            label="Payment Method ID"
            value={intent.paymentMethodId ?? "-"}
          />

          <InfoItem
            label="Amount"
            value={formatAmount(
              intent.amount,
              intent.currency
            )}
          />

          <InfoItem
            label="Currency"
            value={intent.currency}
          />

          <InfoItem
            label="Status"
            value={intent.status}
          />

          <InfoItem
            label="Created"
            value={formatDate(intent.createdAt)}
          />

          <InfoItem
            label="Updated"
            value={formatDate(intent.updatedAt)}
          />

          <InfoItem
            label="Expires"
            value={formatDate(intent.expiresAt)}
          />

          <InfoItem
            label="Payment Attempts"
            value={String(paymentAttempts.length)}
          />

          <InfoItem
            label="Transactions"
            value={String(transactions.length)}
          />
        </div>
      </section>

      <section className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Merchant
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Merchant associated with this payment intent.
          </p>
        </div>

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">
          <InfoItem
            label="Business Name"
            value={intent.merchant?.name ?? "-"}
          />

          <InfoItem
            label="Merchant ID"
            value={intent.merchant?.id ?? intent.merchantId ?? "-"}
          />

          <InfoItem
            label="Business Type"
            value={intent.merchant?.businessType ?? "-"}
          />

          <InfoItem
            label="Email"
            value={intent.merchant?.email ?? "-"}
          />

          <InfoItem
            label="Phone"
            value={intent.merchant?.phone ?? "-"}
          />

          <InfoItem
            label="Status"
            value={intent.merchant?.status ?? "-"}
          />
        </div>
      </section>

      <section className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Payment Attempts
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Attempts made to process this payment intent.
          </p>
        </div>

        {paymentAttempts.length === 0 ? (
          <div className="p-8 text-center text-sm text-slate-500">
            No payment attempts found.
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="border-b border-slate-200 bg-slate-50">
                <tr>
                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    ID
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
                {paymentAttempts.map(
                  (attempt) => (
                    <tr key={attempt.id}>
                      <td className="px-6 py-4 font-mono text-sm text-slate-700">
                        {attempt.id}
                      </td>

                      <td className="px-6 py-4">
                        <PaymentIntentStatus
                          status={
                            attempt.status ?? "UNKNOWN"
                          }
                        />
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-600">
                        {formatDate(
                          attempt.createdAt
                        )}
                      </td>
                    </tr>
                  )
                )}
              </tbody>
            </table>
          </div>
        )}
      </section>

      <section className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Linked Transactions
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Transactions associated with this payment intent.
          </p>
        </div>

        {transactions.length === 0 ? (
          <div className="p-8 text-center text-sm text-slate-500">
            No transactions found.
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="border-b border-slate-200 bg-slate-50">
                <tr>
                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Reference
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
                {transactions.map(
                  (transaction) => (
                    <tr
                      key={transaction.id}
                      className="transition-colors hover:bg-slate-50"
                    >
                      <td className="px-6 py-4">
                        <p className="text-sm font-semibold text-slate-900">
                          {transaction.reference ?? "-"}
                        </p>

                        <p className="mt-1 font-mono text-xs text-slate-500">
                          {transaction.id}
                        </p>
                      </td>

                      <td className="px-6 py-4 text-sm font-semibold text-slate-900">
                        {formatAmount(
                          transaction.amount,
                          transaction.currency
                        )}
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-700">
                        {transaction.type ?? "-"}
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-700">
                        {transaction.paymentMethod ?? "-"}
                      </td>

                      <td className="px-6 py-4">
                        <PaymentIntentStatus
                          status={
                            transaction.status ??
                            "UNKNOWN"
                          }
                        />
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-600">
                        {formatDate(
                          transaction.createdAt
                        )}
                      </td>
                    </tr>
                  )
                )}
              </tbody>
            </table>
          </div>
        )}
      </section>
    </div>
  );
}

function SummaryCard({
  label,
  value,
}: {
  label: string;
  value: string;
}) {
  return (
    <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
      <p className="text-sm font-medium text-slate-500">
        {label}
      </p>

      <p className="mt-3 truncate text-2xl font-bold text-slate-900">
        {value}
      </p>
    </div>
  );
}

function InfoItem({
  label,
  value,
}: {
  label: string;
  value: string;
}) {
  return (
    <div>
      <p className="text-xs font-medium uppercase tracking-wide text-slate-500">
        {label}
      </p>

      <p className="mt-2 break-words text-sm font-medium text-slate-900">
        {value}
      </p>
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
    normalizedStatus === "SUCCEEDED" ||
    normalizedStatus === "SETTLED"
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

function formatAmount(
  amount: number | string,
  currency: string
) {
  const numericAmount = Number(amount);

  if (Number.isNaN(numericAmount)) {
    return `${amount} ${currency}`;
  }

  try {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency,
      maximumFractionDigits: 2,
    }).format(numericAmount);
  } catch {
    return `${numericAmount.toLocaleString()} ${currency}`;
  }
}

function formatDate(
  value: string | null | undefined
) {
  if (!value) {
    return "-";
  }

  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "-";
  }

  return date.toLocaleString();
}
