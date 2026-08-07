"use client";

import Link from "next/link";
import { ArrowRight, CreditCard, Loader2, Store } from "lucide-react";

import { usePaymentIntents } from "@/features/payment-intents/hooks/use-payment-intents";

export default function PaymentLauncherPage() {
  const {
    data,
    isLoading,
    isError,
  } = usePaymentIntents(1, 20);

  const intents = data?.items ?? [];

  return (
    <main className="min-h-screen bg-slate-50 px-4 py-10 sm:px-6">
      <div className="mx-auto max-w-3xl">
        <div className="mb-8">
          <p className="text-xs font-semibold uppercase tracking-[0.16em] text-blue-600">
            SmartPOS Checkout
          </p>

          <h1 className="mt-2 text-3xl font-bold tracking-tight text-slate-950">
            Payment requests
          </h1>

          <p className="mt-2 text-sm leading-6 text-slate-500">
            Select a payment request to open the customer checkout.
          </p>
        </div>

        {isLoading ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-8 shadow-sm">
            <div className="flex items-center justify-center gap-3 text-sm text-slate-500">
              <Loader2 className="animate-spin" size={18} />
              Loading payment requests...
            </div>
          </div>
        ) : isError ? (
          <div className="rounded-2xl border border-red-200 bg-red-50 p-6 text-sm text-red-700">
            Unable to load payment requests.
          </div>
        ) : intents.length === 0 ? (
          <div className="rounded-2xl border border-slate-200 bg-white p-10 text-center shadow-sm">
            <div className="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-blue-50 text-blue-600">
              <CreditCard size={22} />
            </div>

            <h2 className="mt-4 text-lg font-semibold text-slate-950">
              No payment requests yet
            </h2>

            <p className="mx-auto mt-2 max-w-md text-sm leading-6 text-slate-500">
              Create a payment intent from the SmartPOS payment flow first.
              Once one exists, it will appear here automatically.
            </p>

            <Link
              href="/dashboard/payment-intents"
              className="mt-6 inline-flex items-center gap-2 rounded-xl bg-blue-600 px-5 py-3 text-sm font-semibold text-white transition hover:bg-blue-700"
            >
              Open Payment Intents
              <ArrowRight size={16} />
            </Link>
          </div>
        ) : (
          <div className="space-y-3">
            {intents.map((intent) => {
              const merchantName =
                intent.merchant?.name ??
                intent.merchantId ??
                "SmartPOS Merchant";

              const amount = formatAmount(
                intent.amount,
                intent.currency
              );

              return (
                <Link
                  key={intent.id}
                  href={`/pay/${intent.id}`}
                  className="group block rounded-2xl border border-slate-200 bg-white p-5 shadow-sm transition hover:-translate-y-0.5 hover:border-blue-200 hover:shadow-md"
                >
                  <div className="flex items-center justify-between gap-4">
                    <div className="flex min-w-0 items-center gap-4">
                      <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl bg-blue-50 text-blue-600">
                        <Store size={20} />
                      </div>

                      <div className="min-w-0">
                        <p className="truncate text-sm font-semibold text-slate-950">
                          {merchantName}
                        </p>

                        <p className="mt-1 truncate font-mono text-xs text-slate-400">
                          {intent.id}
                        </p>

                        {intent.description ? (
                          <p className="mt-1 truncate text-xs text-slate-500">
                            {intent.description}
                          </p>
                        ) : null}
                      </div>
                    </div>

                    <div className="shrink-0 text-right">
                      <p className="text-lg font-bold text-slate-950">
                        {amount}
                      </p>

                      <span className="mt-1 inline-flex items-center gap-1 text-xs font-semibold text-blue-600">
                        Open checkout
                        <ArrowRight
                          size={13}
                          className="transition-transform group-hover:translate-x-0.5"
                        />
                      </span>
                    </div>
                  </div>
                </Link>
              );
            })}
          </div>
        )}
      </div>
    </main>
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
