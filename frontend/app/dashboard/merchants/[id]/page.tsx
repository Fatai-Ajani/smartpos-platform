"use client";

import Link from "next/link";
import {
  ArrowLeft,
  Building2,
  Mail,
  Phone,
} from "lucide-react";
import { useParams } from "next/navigation";

import { useMerchant } from "@/features/merchants/hooks/use-merchant";

export default function MerchantDetailPage() {
  const params = useParams();
  const id = String(params.id);

  const {
    data: merchant,
    isLoading,
    isError,
  } = useMerchant(id);

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <p className="text-sm text-slate-600">
          Loading merchant...
        </p>
      </div>
    );
  }

  if (isError || !merchant) {
    return (
      <div className="space-y-6">
        <Link
          href="/dashboard/merchants"
          className="inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft className="h-4 w-4" />
          Back to Merchants
        </Link>

        <div className="rounded-xl border border-red-200 bg-red-50 p-8 text-red-700">
          Unable to load merchant.
        </div>
      </div>
    );
  }

  const status = merchant.status?.toUpperCase() ?? "UNKNOWN";

  const statusStyles =
    status === "ACTIVE"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : status === "SUSPENDED"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : "border-slate-200 bg-slate-100 text-slate-700";

  const formatDate = (value?: string | null) => {
    if (!value) {
      return "-";
    }

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) {
      return "-";
    }

    return date.toLocaleString();
  };

  const formatAmount = (
    amount: number | string | null | undefined,
    currency?: string | null
  ) => {
    if (amount === null || amount === undefined) {
      return "-";
    }

    const numericAmount = Number(amount);

    if (Number.isNaN(numericAmount)) {
      return `${amount}${currency ? ` ${currency}` : ""}`;
    }

    try {
      return new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: currency || "USD",
        maximumFractionDigits: 2,
      }).format(numericAmount);
    } catch {
      return `${numericAmount.toLocaleString()} ${currency ?? ""}`.trim();
    }
  };

  return (
    <div className="space-y-6">
      <div>
        <Link
          href="/dashboard/merchants"
          className="inline-flex items-center gap-2 text-sm font-medium text-slate-600 hover:text-slate-900"
        >
          <ArrowLeft className="h-4 w-4" />
          Back to Merchants
        </Link>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <div className="flex flex-col justify-between gap-5 md:flex-row md:items-start">
          <div className="flex items-start gap-4">
            <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-slate-100">
              <Building2 className="h-6 w-6 text-slate-700" />
            </div>

            <div>
              <div className="flex flex-wrap items-center gap-3">
                <h1 className="text-2xl font-bold tracking-tight text-slate-900">
                  {merchant.name}
                </h1>

                <span
                  className={`inline-flex items-center rounded-full border px-3 py-1 text-xs font-semibold ${statusStyles}`}
                >
                  {status}
                </span>

                {merchant.isVerified && (
                  <span className="inline-flex items-center rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-semibold text-blue-700">
                    Verified
                  </span>
                )}
              </div>

              <p className="mt-2 font-mono text-sm text-slate-500">
                {merchant.id}
              </p>
            </div>
          </div>

          <div className="text-left md:text-right">
            <p className="text-xs font-medium uppercase tracking-wide text-slate-500">
              Registered
            </p>

            <p className="mt-1 text-sm font-medium text-slate-900">
              {formatDate(merchant.createdAt)}
            </p>
          </div>
        </div>
      </div>

      <div className="grid gap-4 md:grid-cols-3">
        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <p className="text-sm text-slate-500">
            Terminals
          </p>

          <p className="mt-2 text-2xl font-bold text-slate-900">
            {merchant.terminals?.length ?? 0}
          </p>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <p className="text-sm text-slate-500">
            Transactions
          </p>

          <p className="mt-2 text-2xl font-bold text-slate-900">
            {merchant.transactions?.length ?? 0}
          </p>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <p className="text-sm text-slate-500">
            Transaction Volume
          </p>

          <p className="mt-2 text-2xl font-bold text-slate-900">
            {formatAmount(
              merchant.transactions?.reduce(
                (total, transaction) =>
                  total + Number(transaction.amount || 0),
                0
              ),
              merchant.currency
            )}
          </p>
        </div>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Business Information
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Core information associated with this merchant.
          </p>
        </div>

        <div className="grid gap-6 p-6 md:grid-cols-2 lg:grid-cols-3">
          <InfoItem
            label="Business Name"
            value={merchant.name}
          />

          <InfoItem
            label="Legal Name"
            value={merchant.legalName}
          />

          <InfoItem
            label="Business Type"
            value={merchant.businessType}
          />

          <InfoItem
            label="Currency"
            value={merchant.currency}
          />

          <InfoItem
            label="Timezone"
            value={merchant.timezone}
          />

          <InfoItem
            label="Registration Number"
            value={merchant.registrationNumber}
          />
        </div>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Contact Information
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Contact and location information for this merchant.
          </p>
        </div>

        <div className="grid gap-6 p-6 md:grid-cols-2 lg:grid-cols-3">
          <InfoItem
            label="Email"
            value={merchant.email}
            icon={<Mail className="h-4 w-4" />}
          />

          <InfoItem
            label="Phone"
            value={merchant.phone}
            icon={<Phone className="h-4 w-4" />}
          />

          <InfoItem
            label="Address"
            value={[
              merchant.addressLine1,
              merchant.addressLine2,
              merchant.city,
              merchant.state,
              merchant.postalCode,
              merchant.country,
            ]
              .filter(Boolean)
              .join(", ")}
          />
        </div>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Terminals
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            POS terminals assigned to this merchant.
          </p>
        </div>

        {merchant.terminals?.length ? (
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead className="border-b border-slate-200 bg-slate-50">
                <tr>
                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Terminal
                  </th>

                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Model
                  </th>

                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Manufacturer
                  </th>

                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Status
                  </th>
                </tr>
              </thead>

              <tbody className="divide-y divide-slate-200">
                {merchant.terminals.map((terminal) => (
                  <tr key={terminal.id}>
                    <td className="px-6 py-4">
                      <p className="font-medium text-slate-900">
                        {terminal.serialNumber || terminal.id}
                      </p>

                      <p className="mt-1 font-mono text-xs text-slate-500">
                        {terminal.id}
                      </p>
                    </td>

                    <td className="px-6 py-4 text-sm text-slate-700">
                      {terminal.model ?? "-"}
                    </td>

                    <td className="px-6 py-4 text-sm text-slate-700">
                      {terminal.manufacturer ?? "-"}
                    </td>

                    <td className="px-6 py-4">
                      <TerminalStatus status={terminal.status} />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ) : (
          <div className="p-8 text-center text-sm text-slate-500">
            No terminals assigned to this merchant.
          </div>
        )}
      </div>

      <div className="rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="border-b border-slate-200 p-6">
          <h2 className="text-lg font-semibold text-slate-900">
            Transaction History
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Recent transactions associated with this merchant.
          </p>
        </div>

        {merchant.transactions?.length ? (
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
                    Status
                  </th>

                  <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                    Date
                  </th>
                </tr>
              </thead>

              <tbody className="divide-y divide-slate-200">
                {merchant.transactions.map((transaction) => (
                  <tr
                    key={transaction.id}
                    className="transition-colors hover:bg-slate-50"
                  >
                    <td className="px-6 py-4">
                      <Link
                        href={`/dashboard/transactions/${transaction.id}`}
                        className="font-medium text-blue-600 hover:text-blue-800 hover:underline"
                      >
                        {transaction.reference ?? transaction.id}
                      </Link>
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

                    <td className="px-6 py-4">
                      <span className="inline-flex rounded-full border border-emerald-200 bg-emerald-50 px-3 py-1 text-xs font-semibold text-emerald-700">
                        {transaction.status ?? "-"}
                      </span>
                    </td>

                    <td className="px-6 py-4 text-sm text-slate-600">
                      {formatDate(transaction.createdAt)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ) : (
          <div className="p-8 text-center text-sm text-slate-500">
            No transactions found for this merchant.
          </div>
        )}
      </div>
    </div>
  );
}

function TerminalStatus({
  status,
}: {
  status?: string | null;
}) {
  const normalizedStatus =
    status?.toUpperCase() ?? "UNKNOWN";

  const statusStyles =
    normalizedStatus === "ONLINE"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalizedStatus === "OFFLINE"
        ? "border-red-200 bg-red-50 text-red-700"
        : normalizedStatus === "MAINTENANCE"
          ? "border-amber-200 bg-amber-50 text-amber-700"
          : "border-slate-200 bg-slate-100 text-slate-700";

  return (
    <span
      className={`inline-flex rounded-full border px-3 py-1 text-xs font-semibold ${statusStyles}`}
    >
      {normalizedStatus}
    </span>
  );
}

function InfoItem({
  label,
  value,
  icon,
}: {
  label: string;
  value?: string | null;
  icon?: React.ReactNode;
}) {
  return (
    <div>
      <div className="flex items-center gap-2 text-xs font-medium uppercase tracking-wide text-slate-500">
        {icon}
        {label}
      </div>

      <p className="mt-2 break-words text-sm font-medium text-slate-900">
        {value || "-"}
      </p>
    </div>
  );
}
