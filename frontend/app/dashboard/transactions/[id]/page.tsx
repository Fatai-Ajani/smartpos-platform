"use client";

import Link from "next/link";
import { useParams } from "next/navigation";
import { useQuery } from "@tanstack/react-query";

import { getTransaction } from "@/features/transactions/services/transaction.service";

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

  const currency = transaction.currency || "USD";

  const formatAmount = (
    value: number | string | null | undefined
  ) => {
    if (value === null || value === undefined) {
      return "-";
    }

    const numericValue = Number(value);

    if (Number.isNaN(numericValue)) {
      return `${value} ${currency}`;
    }

    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency,
      maximumFractionDigits: 2,
    }).format(numericValue);
  };

  const formatDate = (
    value: string | undefined | null
  ) => {
    if (!value) {
      return "-";
    }

    const date = new Date(value);

    if (Number.isNaN(date.getTime())) {
      return "-";
    }

    return date.toLocaleString();
  };

  return (
    <div className="space-y-8">

      {/* Header */}

      <div className="space-y-4">

        <Link
          href="/dashboard/transactions"
          className="inline-flex text-sm font-medium text-blue-600 hover:text-blue-800"
        >
          ← Back to Transactions
        </Link>

        <div className="flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">

          <div>

            <p className="text-sm font-medium text-slate-500">
              Transaction Details
            </p>

            <h1 className="mt-2 text-3xl font-semibold tracking-tight text-slate-900">
              {transaction.reference ?? transaction.id}
            </h1>

            <p className="mt-2 font-mono text-xs text-slate-500">
              {transaction.id}
            </p>

          </div>

          <TransactionStatus
            status={transaction.status}
          />

        </div>

      </div>

      {/* Transaction Summary */}

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">

        <MetricCard
          label="Amount"
          value={formatAmount(transaction.amount)}
        />

        <MetricCard
          label="Type"
          value={transaction.type ?? "-"}
        />

        <MetricCard
          label="Payment Method"
          value={transaction.paymentMethod ?? "-"}
        />

        <MetricCard
          label="Settlement"
          value={transaction.settlementStatus ?? "-"}
        />

      </div>

      {/* Transaction Information */}

      <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <SectionHeader
          title="Transaction Information"
          description="Core information associated with this payment transaction."
        />

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Reference"
            value={transaction.reference}
          />

          <DetailItem
            label="Transaction ID"
            value={transaction.id}
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
            label="Amount"
            value={formatAmount(transaction.amount)}
          />

          <DetailItem
            label="Currency"
            value={transaction.currency}
          />

          <DetailItem
            label="Payment Method"
            value={transaction.paymentMethod}
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
            label="Description"
            value={transaction.description}
          />

          <DetailItem
            label="Created"
            value={formatDate(transaction.createdAt)}
          />

          <DetailItem
            label="Updated"
            value={formatDate(transaction.updatedAt)}
          />

        </div>

      </section>

      {/* Merchant & Terminal */}

      <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <SectionHeader
          title="Merchant & Terminal"
          description="The merchant and terminal associated with this transaction."
        />

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Merchant"
            value={
              transaction.merchant?.name ??
              transaction.merchantId
            }
          />

          <DetailItem
            label="Merchant ID"
            value={transaction.merchantId}
          />

          <DetailItem
            label="Terminal"
            value={
              transaction.terminal?.serialNumber ??
              transaction.terminalId
            }
          />

          <DetailItem
            label="Terminal ID"
            value={transaction.terminalId}
          />

          <DetailItem
            label="Customer ID"
            value={transaction.customerId}
          />

          <DetailItem
            label="Wallet ID"
            value={transaction.walletId}
          />

        </div>

      </section>

      {/* Settlement */}

      <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <SectionHeader
          title="Settlement Information"
          description="Settlement status and settlement-related transaction values."
        />

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Settlement Status"
            value={transaction.settlementStatus}
          />

          <DetailItem
            label="Settlement Amount"
            value={
              transaction.settlementAmount !== null &&
              transaction.settlementAmount !== undefined
                ? formatAmount(transaction.settlementAmount)
                : undefined
            }
          />

          <DetailItem
            label="Settlement Currency"
            value={transaction.settlementCurrency}
          />

          <DetailItem
            label="Settlement Date"
            value={formatDate(transaction.settlementDate)}
          />

          <DetailItem
            label="Fee Amount"
            value={
              transaction.feeAmount !== null &&
              transaction.feeAmount !== undefined
                ? formatAmount(transaction.feeAmount)
                : undefined
            }
          />

          <DetailItem
            label="Net Amount"
            value={
              transaction.netAmount !== null &&
              transaction.netAmount !== undefined
                ? formatAmount(transaction.netAmount)
                : undefined
            }
          />

        </div>

      </section>

      {/* Gateway */}

      <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <SectionHeader
          title="Gateway Information"
          description="Payment gateway and authorization information."
        />

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Gateway Provider"
            value={transaction.gatewayProvider}
          />

          <DetailItem
            label="Gateway Transaction ID"
            value={transaction.gatewayTransactionId}
          />

          <DetailItem
            label="Approval Code"
            value={transaction.approvalCode}
          />

          <DetailItem
            label="Authorization Code"
            value={transaction.authCode}
          />

        </div>

      </section>

      {/* Payment Intent */}

      <section className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <SectionHeader
          title="Payment Intent"
          description="Payment intent associated with this transaction."
        />

        <div className="grid gap-6 p-6 sm:grid-cols-2 lg:grid-cols-3">

          <DetailItem
            label="Payment Intent ID"
            value={transaction.paymentIntentId}
          />

        </div>

      </section>

    </div>
  );
}

function SectionHeader({
  title,
  description,
}: {
  title: string;
  description: string;
}) {
  return (
    <div className="border-b border-slate-200 px-6 py-5">

      <h2 className="text-lg font-semibold text-slate-900">
        {title}
      </h2>

      <p className="mt-1 text-sm text-slate-500">
        {description}
      </p>

    </div>
  );
}

function MetricCard({
  label,
  value,
}: {
  label: string;
  value: string;
}) {
  return (
    <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">

      <p className="text-sm font-medium text-slate-500">
        {label}
      </p>

      <p className="mt-2 text-xl font-semibold text-slate-900">
        {value}
      </p>

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
    <div>

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
