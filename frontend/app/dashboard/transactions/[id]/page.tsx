"use client";

import Link from "next/link";
import { useParams } from "next/navigation";
import { useQuery } from "@tanstack/react-query";

import { getTransaction } from "@/features/transactions/services/transaction-details.service";

export default function TransactionDetailsPage() {
  const params = useParams<{ id: string }>();
  const id = params.id;

  const {
    data: transaction,
    isLoading,
    error,
  } = useQuery({
    queryKey: ["transaction", id],
    queryFn: () => getTransaction(id),
    enabled: Boolean(id),
  });

  if (isLoading) {
    return (
      <div className="flex min-h-[400px] items-center justify-center">
        <p className="text-sm text-slate-600">
          Loading transaction details...
        </p>
      </div>
    );
  }

  if (error || !transaction) {
    return (
      <div className="space-y-6">
        <Link
          href="/dashboard/transactions"
          className="inline-flex text-sm font-medium text-blue-600 hover:text-blue-800"
        >
          ← Back to Transactions
        </Link>

        <div className="rounded-xl border border-red-200 bg-red-50 p-6">
          <h1 className="text-lg font-semibold text-red-800">
            Unable to load transaction
          </h1>

          <p className="mt-2 text-sm text-red-700">
            The requested transaction could not be found or could not be
            loaded from the SmartPOS API.
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="space-y-6">

      <div>
        <Link
          href="/dashboard/transactions"
          className="text-sm font-medium text-blue-600 hover:text-blue-800"
        >
          ← Back to Transactions
        </Link>

        <h1 className="mt-4 text-3xl font-bold tracking-tight text-slate-900">
          Transaction Details
        </h1>

        <p className="mt-2 text-sm text-slate-600">
          Review the full details of this payment transaction.
        </p>
      </div>

      <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">

        <div className="flex flex-col gap-4 border-b border-slate-200 bg-slate-50 px-6 py-6 sm:flex-row sm:items-center sm:justify-between">

          <div>
            <p className="text-sm font-medium text-slate-600">
              Transaction Reference
            </p>

            <h2 className="mt-1 text-xl font-bold text-slate-900">
              {transaction.reference ?? transaction.id}
            </h2>
          </div>

          <TransactionStatus status={transaction.status} />

        </div>

        <div className="grid gap-4 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Transaction ID"
            value={transaction.id}
          />

          <DetailItem
            label="Reference"
            value={transaction.reference}
          />

          <DetailItem
            label="Amount"
            value={`${transaction.amount} ${transaction.currency}`}
          />

          <DetailItem
            label="Status"
            value={transaction.status}
          />

          <DetailItem
            label="Transaction Type"
            value={transaction.type}
          />

          <DetailItem
            label="Payment Method"
            value={transaction.paymentMethod}
          />

          <DetailItem
            label="Merchant"
            value={transaction.merchant?.name ?? transaction.merchantId}
          />

          <DetailItem
            label="Terminal"
            value={
              transaction.terminal?.serialNumber ??
              transaction.terminalId
            }
          />

          <DetailItem
            label="Customer"
            value={
              transaction.customer?.email ??
              transaction.customerId
            }
          />

          <DetailItem
            label="Card Brand"
            value={transaction.cardBrand}
          />

          <DetailItem
            label="Card Last Four"
            value={
              transaction.cardLastFour
                ? `•••• ${transaction.cardLastFour}`
                : undefined
            }
          />

          <DetailItem
            label="Gateway Provider"
            value={transaction.gatewayProvider}
          />

          <DetailItem
            label="Gateway Transaction ID"
            value={transaction.gatewayTransactionId}
          />

          <DetailItem
            label="Settlement Status"
            value={transaction.settlementStatus}
          />

          <DetailItem
            label="Settlement Amount"
            value={
              transaction.settlementAmount != null
                ? `${transaction.settlementAmount} ${
                    transaction.settlementCurrency ??
                    transaction.currency
                  }`
                : undefined
            }
          />

          <DetailItem
            label="Created"
            value={formatDate(transaction.createdAt)}
          />

          <DetailItem
            label="Updated"
            value={
              transaction.updatedAt
                ? formatDate(transaction.updatedAt)
                : undefined
            }
          />

          <DetailItem
            label="Description"
            value={transaction.description}
          />

        </div>

      </div>

    </div>
  );
}

function DetailItem({
  label,
  value,
}: {
  label: string;
  value?: string | number | null;
}) {
  return (
    <div className="rounded-lg border border-slate-200 bg-slate-50 p-5">

      <p className="text-xs font-semibold uppercase tracking-wide text-slate-500">
        {label}
      </p>

      <p className="mt-2 break-words text-sm font-semibold text-slate-900">
        {value ?? "-"}
      </p>

    </div>
  );
}

function TransactionStatus({
  status,
}: {
  status: string;
}) {
  const normalizedStatus = status.toUpperCase();

  const statusStyles =
    normalizedStatus === "SETTLED"
      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
      : normalizedStatus === "PENDING"
        ? "border-amber-200 bg-amber-50 text-amber-700"
        : normalizedStatus === "FAILED"
          ? "border-red-200 bg-red-50 text-red-700"
          : normalizedStatus === "REFUNDED"
            ? "border-purple-200 bg-purple-50 text-purple-700"
            : "border-slate-200 bg-slate-100 text-slate-700";

  return (
    <span
      className={`inline-flex w-fit items-center rounded-full border px-3 py-1.5 text-xs font-bold ${statusStyles}`}
    >
      {normalizedStatus}
    </span>
  );
}

function formatDate(value: string | Date) {
  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "-";
  }

  return date.toLocaleString();
}
