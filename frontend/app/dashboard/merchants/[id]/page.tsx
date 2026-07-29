"use client";

import Link from "next/link";
import { useParams } from "next/navigation";

import {
  ArrowLeft,
  Building2,
  CheckCircle2,
  CreditCard,
  Mail,
  Phone,
  ShieldCheck,
  Store,
  Terminal,
  Wallet,
} from "lucide-react";

import { useMerchant } from "@/features/merchants/hooks/use-merchant";

function formatDate(
  value?: string | null
) {
  if (!value) {
    return "—";
  }

  return new Date(
    value
  ).toLocaleDateString(
    "en-US",
    {
      month: "short",
      day: "numeric",
      year: "numeric",
    }
  );
}

function formatDateTime(
  value?: string | null
) {
  if (!value) {
    return "—";
  }

  return new Date(
    value
  ).toLocaleString(
    "en-US",
    {
      dateStyle: "medium",
      timeStyle: "short",
    }
  );
}

function formatAmount(
  amount?: number | string | null,
  currency = "USD"
) {
  if (
    amount === null ||
    amount === undefined
  ) {
    return "—";
  }

  return new Intl.NumberFormat(
    "en-US",
    {
      style: "currency",
      currency,
    }
  ).format(
    Number(amount)
  );
}

function statusClasses(
  status?: string | null
) {
  switch (
    status?.toUpperCase()
  ) {
    case "ACTIVE":
    case "ONLINE":
    case "SETTLED":
      return "bg-emerald-50 text-emerald-700";

    case "PENDING":
      return "bg-amber-50 text-amber-700";

    case "SUSPENDED":
    case "OFFLINE":
      return "bg-red-50 text-red-700";

    default:
      return "bg-slate-100 text-slate-600";
  }
}

export default function MerchantDetailPage() {
  const params = useParams();

  const id = String(
    params.id
  );

  const {
    data: merchant,
    isLoading,
    isError,
  } = useMerchant(id);

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="h-8 w-40 animate-pulse rounded bg-slate-200" />

        <div className="h-32 animate-pulse rounded-xl bg-slate-200" />

        <div className="grid gap-5 lg:grid-cols-3">
          <div className="h-64 animate-pulse rounded-xl bg-slate-200" />
          <div className="h-64 animate-pulse rounded-xl bg-slate-200" />
          <div className="h-64 animate-pulse rounded-xl bg-slate-200" />
        </div>
      </div>
    );
  }

  if (
    isError ||
    !merchant
  ) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6">
        <h2 className="font-semibold text-red-800">
          Unable to load merchant
        </h2>

        <p className="mt-1 text-sm text-red-700">
          The merchant could not be found or the API request failed.
        </p>

        <Link
          href="/dashboard/merchants"
          className="mt-4 inline-flex items-center gap-2 text-sm font-medium text-red-800 hover:underline"
        >
          <ArrowLeft size={16} />
          Back to Merchants
        </Link>
      </div>
    );
  }

  const terminals =
    merchant.terminals ?? [];

  const transactions =
    merchant.transactions ?? [];

  const transactionVolume =
    transactions.reduce(
      (
        total,
        transaction
      ) =>
        total +
        Number(
          transaction.amount ?? 0
        ),
      0
    );

  return (
    <div>
      <Link
        href="/dashboard/merchants"
        className="mb-6 inline-flex items-center gap-2 text-sm font-medium text-slate-500 transition hover:text-slate-900"
      >
        <ArrowLeft size={16} />
        Back to Merchants
      </Link>

      {/* Header */}
      <div className="mb-8 rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <div className="flex flex-col gap-6 lg:flex-row lg:items-center lg:justify-between">
          <div className="flex items-center gap-4">
            <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-blue-50 text-blue-600">
              <Building2 size={26} />
            </div>

            <div>
              <div className="flex flex-wrap items-center gap-3">
                <h1 className="text-2xl font-bold text-slate-900">
                  {merchant.name}
                </h1>

                <span
                  className={`rounded-full px-3 py-1 text-xs font-semibold ${statusClasses(
                    merchant.status
                  )}`}
                >
                  {merchant.status ??
                    "UNKNOWN"}
                </span>

                {merchant.isVerified && (
                  <span className="inline-flex items-center gap-1 rounded-full bg-blue-50 px-3 py-1 text-xs font-semibold text-blue-700">
                    <ShieldCheck
                      size={14}
                    />
                    Verified
                  </span>
                )}
              </div>

              <p className="mt-2 font-mono text-xs text-slate-500">
                {merchant.id}
              </p>
            </div>
          </div>

          <div className="text-left lg:text-right">
            <p className="text-sm text-slate-500">
              Registered
            </p>

            <p className="mt-1 font-semibold text-slate-900">
              {formatDate(
                merchant.createdAt
              )}
            </p>
          </div>
        </div>
      </div>

      {/* Summary */}
      <div className="mb-8 grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-blue-50 p-3 text-blue-600">
              <Terminal size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Terminals
              </p>

              <p className="mt-1 text-2xl font-bold text-slate-900">
                {terminals.length}
              </p>
            </div>
          </div>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-emerald-50 p-3 text-emerald-600">
              <CreditCard size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Transactions
              </p>

              <p className="mt-1 text-2xl font-bold text-slate-900">
                {transactions.length}
              </p>
            </div>
          </div>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-violet-50 p-3 text-violet-600">
              <Wallet size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Transaction Volume
              </p>

              <p className="mt-1 text-2xl font-bold text-slate-900">
                {formatAmount(
                  transactionVolume,
                  merchant.currency ??
                    "USD"
                )}
              </p>
            </div>
          </div>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-amber-50 p-3 text-amber-600">
              <Store size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Business Type
              </p>

              <p className="mt-1 text-lg font-bold text-slate-900">
                {merchant.businessType ??
                  "—"}
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Merchant Information */}
      <div className="mb-8 grid gap-6 lg:grid-cols-2">
        <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <div className="mb-6">
            <h2 className="text-lg font-semibold text-slate-900">
              Business Information
            </h2>

            <p className="mt-1 text-sm text-slate-500">
              Core information associated with this merchant.
            </p>
          </div>

          <div className="grid gap-5 sm:grid-cols-2">
            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Business Name
              </p>

              <p className="mt-1 text-sm font-medium text-slate-900">
                {merchant.name}
              </p>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Legal Name
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {merchant.legalName ??
                  "—"}
              </p>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Business Type
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {merchant.businessType ??
                  "—"}
              </p>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Currency
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {merchant.currency ??
                  "—"}
              </p>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Timezone
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {merchant.timezone ??
                  "—"}
              </p>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Registration Number
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {merchant.registrationNumber ??
                  "—"}
              </p>
            </div>
          </div>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
          <div className="mb-6">
            <h2 className="text-lg font-semibold text-slate-900">
              Contact Information
            </h2>

            <p className="mt-1 text-sm text-slate-500">
              Contact and location information for this merchant.
            </p>
          </div>

          <div className="space-y-5">
            <div className="flex items-center gap-3">
              <div className="rounded-lg bg-slate-100 p-2 text-slate-600">
                <Mail size={18} />
              </div>

              <div>
                <p className="text-xs text-slate-400">
                  Email
                </p>

                <p className="text-sm font-medium text-slate-900">
                  {merchant.email ??
                    "—"}
                </p>
              </div>
            </div>

            <div className="flex items-center gap-3">
              <div className="rounded-lg bg-slate-100 p-2 text-slate-600">
                <Phone size={18} />
              </div>

              <div>
                <p className="text-xs text-slate-400">
                  Phone
                </p>

                <p className="text-sm font-medium text-slate-900">
                  {merchant.phone ??
                    "—"}
                </p>
              </div>
            </div>

            <div>
              <p className="text-xs font-medium uppercase tracking-wide text-slate-400">
                Address
              </p>

              <p className="mt-1 text-sm text-slate-700">
                {[
                  merchant.addressLine1,
                  merchant.addressLine2,
                  merchant.city,
                  merchant.state,
                  merchant.postalCode,
                  merchant.country,
                ]
                  .filter(
                    Boolean
                  )
                  .join(", ") ||
                  "No address provided"}
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Terminals */}
      <div className="mb-8 rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Terminals
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            POS terminals assigned to this merchant.
          </p>
        </div>

        {terminals.length === 0 ? (
          <div className="p-8 text-center text-sm text-slate-500">
            No terminals assigned to this merchant.
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[800px]">
              <thead>
                <tr className="border-b border-slate-200 bg-slate-50">
                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Terminal
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Model
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Manufacturer
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Status
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Active
                  </th>
                </tr>
              </thead>

              <tbody className="divide-y divide-slate-100">
                {terminals.map(
                  (terminal) => (
                    <tr
                      key={
                        terminal.id
                      }
                    >
                      <td className="px-6 py-5">
                        <p className="font-semibold text-slate-900">
                          {
                            terminal.serialNumber
                          }
                        </p>

                        <p className="mt-1 font-mono text-xs text-slate-500">
                          {
                            terminal.id
                          }
                        </p>
                      </td>

                      <td className="px-6 py-5 text-sm text-slate-700">
                        {
                          terminal.model ??
                          "—"
                        }
                      </td>

                      <td className="px-6 py-5 text-sm text-slate-700">
                        {
                          terminal.manufacturer ??
                          "—"
                        }
                      </td>

                      <td className="px-6 py-5">
                        <span
                          className={`rounded-full px-2.5 py-1 text-xs font-semibold ${statusClasses(
                            terminal.status
                          )}`}
                        >
                          {
                            terminal.status ??
                            "UNKNOWN"
                          }
                        </span>
                      </td>

                      <td className="px-6 py-5">
                        {terminal.isActive ? (
                          <CheckCircle2
                            size={20}
                            className="text-emerald-600"
                          />
                        ) : (
                          <span className="text-sm text-slate-400">
                            No
                          </span>
                        )}
                      </td>
                    </tr>
                  )
                )}
              </tbody>
            </table>
          </div>
        )}
      </div>

      {/* Transactions */}
      <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Transaction History
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Recent transactions associated with this merchant.
          </p>
        </div>

        {transactions.length === 0 ? (
          <div className="p-8 text-center text-sm text-slate-500">
            No transactions found for this merchant.
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full min-w-[900px]">
              <thead>
                <tr className="border-b border-slate-200 bg-slate-50">
                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Reference
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Amount
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Type
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Payment Method
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Status
                  </th>

                  <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                    Date
                  </th>
                </tr>
              </thead>

              <tbody className="divide-y divide-slate-100">
                {transactions.map(
                  (transaction) => (
                    <tr
                      key={
                        transaction.id
                      }
                      className="hover:bg-slate-50"
                    >
                      <td className="px-6 py-5">
                        <p className="font-medium text-slate-900">
                          {
                            transaction.reference ??
                            "—"
                          }
                        </p>

                        <p className="mt-1 font-mono text-xs text-slate-500">
                          {
                            transaction.id
                          }
                        </p>
                      </td>

                      <td className="px-6 py-5 font-semibold text-slate-900">
                        {formatAmount(
                          transaction.amount,
                          transaction.currency
                        )}
                      </td>

                      <td className="px-6 py-5 text-sm text-slate-700">
                        {
                          transaction.type ??
                          "—"
                        }
                      </td>

                      <td className="px-6 py-5 text-sm text-slate-700">
                        {
                          transaction.paymentMethod ??
                          "—"
                        }
                      </td>

                      <td className="px-6 py-5">
                        <span
                          className={`rounded-full px-2.5 py-1 text-xs font-semibold ${statusClasses(
                            transaction.status
                          )}`}
                        >
                          {
                            transaction.status
                          }
                        </span>
                      </td>

                      <td className="px-6 py-5 text-sm text-slate-600">
                        {formatDateTime(
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
      </div>
    </div>
  );
}
