"use client";

import Link from "next/link";
import { useParams } from "next/navigation";
import {
  ArrowLeft,
  CheckCircle2,
  CreditCard,
  LockKeyhole,
  ShieldCheck,
  Store,
} from "lucide-react";

import { usePaymentIntent } from "@/features/payment-intents/hooks/use-payment-intent";

export default function CustomerPaymentPage() {
  const params = useParams();
  const id = String(params.id);

  const {
    data: intent,
    isLoading,
    isError,
  } = usePaymentIntent(id);

  if (isLoading) {
    return (
      <main className="min-h-screen bg-slate-50 px-4 py-10">
        <div className="mx-auto max-w-md">
          <div className="rounded-3xl border border-slate-200 bg-white p-8 shadow-xl shadow-slate-200/40">
            <div className="mx-auto h-10 w-10 animate-pulse rounded-full bg-slate-200" />
            <div className="mx-auto mt-5 h-6 w-48 animate-pulse rounded bg-slate-200" />
            <div className="mx-auto mt-3 h-4 w-64 animate-pulse rounded bg-slate-200" />
            <div className="mt-8 h-24 animate-pulse rounded-2xl bg-slate-100" />
            <div className="mt-6 h-12 animate-pulse rounded-xl bg-slate-200" />
          </div>
        </div>
      </main>
    );
  }

  if (isError || !intent) {
    return (
      <main className="flex min-h-screen items-center justify-center bg-slate-50 px-4">
        <div className="w-full max-w-md rounded-3xl border border-slate-200 bg-white p-8 text-center shadow-xl shadow-slate-200/40">
          <div className="mx-auto flex h-12 w-12 items-center justify-center rounded-full bg-red-50 text-red-600">
            <CreditCard size={22} />
          </div>

          <h1 className="mt-5 text-xl font-semibold text-slate-950">
            Payment unavailable
          </h1>

          <p className="mt-2 text-sm leading-6 text-slate-500">
            We could not load this payment request.
          </p>

          <Link
            href="/pay"
            className="mt-6 inline-flex items-center gap-2 rounded-xl bg-slate-900 px-5 py-3 text-sm font-semibold text-white hover:bg-slate-800"
          >
            <ArrowLeft size={16} />
            Back to payment requests
          </Link>
        </div>
      </main>
    );
  }

  const merchantName =
    intent.merchant?.name ??
    intent.merchantId ??
    "SmartPOS Merchant";

  const amount = formatAmount(
    intent.amount,
    intent.currency
  );

  const status =
    intent.status?.toUpperCase() ?? "UNKNOWN";

  const isCompleted =
    status === "SUCCEEDED" ||
    status === "SETTLED";

  const isFailed =
    status === "FAILED" ||
    status === "CANCELED" ||
    status === "CANCELLED";

  return (
    <main className="min-h-screen bg-slate-50">
      <div className="mx-auto flex min-h-screen w-full max-w-6xl items-center justify-center px-4 py-8 sm:px-6">
        <div className="w-full max-w-md">

          <div className="mb-5 flex items-center justify-center gap-2 text-xs font-semibold uppercase tracking-[0.16em] text-slate-400">
            <LockKeyhole size={13} />
            Secure payment
          </div>

          <section className="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-2xl shadow-slate-200/50">

            <div className="border-b border-slate-100 bg-gradient-to-br from-white via-white to-blue-50/80 px-6 pb-7 pt-7">

              <div className="flex items-center gap-3">
                <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-blue-600 text-white shadow-lg shadow-blue-600/20">
                  <Store size={20} />
                </div>

                <div className="min-w-0">
                  <p className="truncate text-sm font-semibold text-slate-950">
                    {merchantName}
                  </p>

                  <p className="mt-0.5 text-xs text-slate-500">
                    Payment request
                  </p>
                </div>
              </div>

              <div className="mt-7 text-center">
                <p className="text-xs font-semibold uppercase tracking-[0.14em] text-slate-400">
                  Amount due
                </p>

                <p className="mt-2 text-4xl font-bold tracking-tight text-slate-950">
                  {amount}
                </p>

                {intent.description ? (
                  <p className="mx-auto mt-3 max-w-sm text-sm leading-6 text-slate-500">
                    {intent.description}
                  </p>
                ) : null}
              </div>
            </div>

            <div className="p-6">

              {isCompleted ? (
                <div className="rounded-2xl border border-emerald-200 bg-emerald-50 p-5 text-center">
                  <CheckCircle2
                    className="mx-auto text-emerald-600"
                    size={30}
                  />

                  <h2 className="mt-3 font-semibold text-emerald-950">
                    Payment completed
                  </h2>

                  <p className="mt-1 text-sm text-emerald-700">
                    This payment has already been completed.
                  </p>
                </div>
              ) : isFailed ? (
                <div className="rounded-2xl border border-red-200 bg-red-50 p-5 text-center">
                  <h2 className="font-semibold text-red-950">
                    Payment unavailable
                  </h2>

                  <p className="mt-1 text-sm leading-6 text-red-700">
                    This payment request can no longer be completed.
                  </p>
                </div>
              ) : (
                <>
                  <div className="rounded-2xl border border-slate-200 bg-slate-50 p-4">
                    <div className="flex items-center gap-3">
                      <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-white text-blue-600 shadow-sm">
                        <CreditCard size={19} />
                      </div>

                      <div>
                        <p className="text-sm font-semibold text-slate-900">
                          Pay securely
                        </p>

                        <p className="mt-0.5 text-xs text-slate-500">
                          Your payment details are protected.
                        </p>
                      </div>
                    </div>
                  </div>

                  <button
                    type="button"
                    disabled
                    className="mt-5 flex h-13 w-full items-center justify-center rounded-xl bg-blue-600 px-5 text-sm font-semibold text-white shadow-lg shadow-blue-600/20 disabled:cursor-not-allowed disabled:opacity-100"
                  >
                    Continue to payment
                  </button>

                  <p className="mt-4 text-center text-xs leading-5 text-slate-400">
                    Secure payment processing will be connected to this
                    checkout next.
                  </p>
                </>
              )}

              <div className="mt-6 flex items-center justify-center gap-5 border-t border-slate-100 pt-5 text-xs text-slate-400">
                <span className="inline-flex items-center gap-1.5">
                  <LockKeyhole size={12} />
                  Encrypted
                </span>

                <span className="inline-flex items-center gap-1.5">
                  <ShieldCheck size={13} />
                  Secure checkout
                </span>
              </div>
            </div>
          </section>

          <p className="mt-5 text-center text-xs text-slate-400">
            Powered by SmartPOS
          </p>
        </div>
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
