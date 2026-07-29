"use client";

import { use } from "react";

import Link from "next/link";
import {
  ArrowLeft,
  CreditCard,
  CalendarDays,
  Store,
} from "lucide-react";

import {
  usePaymentIntent,
} from "@/features/payment-intents/hooks/use-payment-intents";

interface PaymentIntentDetailPageProps {
  params: Promise<{
    id: string;
  }>;
}

export default function PaymentIntentDetailPage({
  params,
}: PaymentIntentDetailPageProps) {
  const { id } =
    use(params);

  const {
    data,
    isLoading,
    isError,
  } = usePaymentIntent(id);

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-sm text-slate-500 shadow-sm">
        Loading payment intent...
      </div>
    );
  }

  if (isError || !data) {
    return (
      <div className="space-y-5">

        <Link
          href="/dashboard/payment-intents"
          className="inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft size={16} />
          Back to Payment Intents
        </Link>

        <div className="rounded-xl border border-red-200 bg-red-50 p-6 text-sm text-red-700">
          Unable to load this payment intent.
        </div>

      </div>
    );
  }

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

        <div className="flex flex-col gap-4 lg:flex-row lg:items-end lg:justify-between">

          <div>
            <p className="text-sm font-medium text-blue-600">
              Payment Intent
            </p>

            <h1 className="mt-2 text-3xl font-bold tracking-tight text-slate-900">
              Payment Intent Details
            </h1>

            <p className="mt-2 font-mono text-sm text-slate-500">
              {data.id}
            </p>
          </div>

          <PaymentIntentStatus
            status={data.status}
          />

        </div>
      </div>

      <div className="grid gap-5 md:grid-cols-3">

        <SummaryCard
          icon={
            <CreditCard
              size={20}
            />
          }
          label="Amount"
          value={formatAmount(
            data.amount,
            data.currency
          )}
        />

        <SummaryCard
          icon={
            <Store
              size={20}
            />
          }
          label="Merchant"
          value={
            data.merchant?.name ??
            data.merchantId ??
            "-"
          }
        />

        <SummaryCard
          icon={
            <CalendarDays
              size={20}
            />
          }
          label="Created"
          value={formatDate(
            data.createdAt
          )}
        />

      </div>

      <div className="grid gap-6 lg:grid-cols-2">

        <section className="rounded-xl border border-slate-200 bg-white shadow-sm">

          <div className="border-b border-slate-200 px-6 py-5">
            <h2 className="font-semibold text-slate-900">
              Payment Intent Information
            </h2>

            <p className="mt-1 text-sm text-slate-500">
              Core information associated with this payment request.
            </p>
          </div>

          <div className="grid gap-5 p-6 sm:grid-cols-2">
            <Detail
              label="Payment Intent ID"
              value={data.id}
              mono
            />

            <Detail
              label="Status"
              value={data.status}
            />

            <Detail
              label="Amount"
              value={formatAmount(
                data.amount,
                data.currency
              )}
            />

            <Detail
              label="Currency"
              value={data.currency}
            />

            <Detail
              label="Description"
              value={
                data.description ??
                "-"
              }
            />

            <Detail
              label="Payment Method ID"
              value={
                data.paymentMethodId ??
                "-"
              }
            />

            <Detail
              label="Customer ID"
              value={
                data.customerId ??
                "-"
              }
            />

            <Detail
              label="Expires At"
              value={
                data.expiresAt
                  ? formatDate(
                      data.expiresAt
                    )
                  : "-"
              }
            />
          </div>

        </section>

        <section className="rounded-xl border border-slate-200 bg-white shadow-sm">

          <div className="border-b border-slate-200 px-6 py-5">
            <h2 className="font-semibold text-slate-900">
              Merchant Information
            </h2>

            <p className="mt-1 text-sm text-slate-500">
              Merchant associated with this payment intent.
            </p>
          </div>

          <div className="grid gap-5 p-6">

            <Detail
              label="Merchant"
              value={
                data.merchant?.name ??
                "-"
              }
            />

            <Detail
              label="Merchant ID"
              value={
                data.merchant?.id ??
                data.merchantId ??
                "-"
              }
              mono
            />

            <Detail
              label="Merchant Status"
              value={
                data.merchant
                  ? "ACTIVE"
                  : "-"
              }
            />

            <Detail
              label="Client Secret"
              value={
                data.clientSecret
                  ? "Available"
                  : "-"
              }
            />

            <Detail
              label="Updated"
              value={
                data.updatedAt
                  ? formatDate(
                      data.updatedAt
                    )
                  : "-"
              }
            />

          </div>

        </section>

      </div>

    </div>
  );
}

function SummaryCard({
  icon,
  label,
  value,
}: {
  icon: React.ReactNode;
  label: string;
  value: string;
}) {
  return (
    <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

      <div className="flex items-center gap-3">
        <div className="rounded-lg bg-blue-50 p-3 text-blue-600">
          {icon}
        </div>

        <p className="text-sm font-medium text-slate-500">
          {label}
        </p>
      </div>

      <p className="mt-5 truncate text-xl font-bold text-slate-900">
        {value}
      </p>

    </div>
  );
}

function Detail({
  label,
  value,
  mono = false,
}: {
  label: string;
  value: string;
  mono?: boolean;
}) {
  return (
    <div>
      <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
        {label}
      </p>

      <p
        className={`mt-2 break-all text-sm font-medium text-slate-900 ${
          mono
            ? "font-mono"
            : ""
        }`}
      >
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
  const normalized =
    status.toUpperCase();

  const styles =
    normalized === "SUCCEEDED"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalized === "PENDING"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : normalized === "FAILED"
          ? "border-red-200 bg-red-50 text-red-700"
          : "border-slate-200 bg-slate-100 text-slate-700";

  return (
    <span
      className={`inline-flex w-fit rounded-full border px-3 py-1 text-xs font-semibold ${styles}`}
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
  value: string
) {
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
