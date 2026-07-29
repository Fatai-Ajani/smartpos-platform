"use client";

import { useMemo, useState } from "react";
import { RefreshCw, Search } from "lucide-react";
import { useRouter } from "next/navigation";

import { useTransactions } from "@/features/transactions/hooks/use-transactions";
import type { Transaction } from "@/features/transactions/types/transaction";

const EMPTY_TRANSACTIONS: Transaction[] = [];

export function TransactionTable() {
  const router = useRouter();

  const {
    data,
    isLoading,
    isError,
    refetch,
    isFetching,
  } = useTransactions();

  const [search, setSearch] = useState("");
  const [statusFilter, setStatusFilter] = useState("ALL");

  const transactions = data?.items ?? EMPTY_TRANSACTIONS;

  const filteredTransactions = useMemo(() => {
    const query = search.trim().toLowerCase();

    return transactions.filter((transaction) => {
      const matchesStatus =
        statusFilter === "ALL" ||
        transaction.status?.toUpperCase() === statusFilter;

      if (!matchesStatus) {
        return false;
      }

      if (!query) {
        return true;
      }

      const searchableValues = [
        transaction.id,
        transaction.reference,
        transaction.merchant?.name,
        transaction.merchantId,
        transaction.type,
        transaction.paymentMethod,
        transaction.status,
        transaction.currency,
      ];

      return searchableValues.some((value) =>
        String(value ?? "")
          .toLowerCase()
          .includes(query)
      );
    });
  }, [transactions, search, statusFilter]);

  const formatAmount = (
    amount: number | string,
    currency: string
  ) => {
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
  };

  const formatDate = (value: string) => {
    const date = new Date(value);

    if (Number.isNaN(date.getTime())) {
      return "-";
    }

    return date.toLocaleString();
  };

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <p className="text-sm text-slate-600">
          Loading transactions...
        </p>
      </div>
    );
  }

  if (isError) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-8 text-center">
        <h2 className="text-lg font-semibold text-red-800">
          Unable to load transactions
        </h2>

        <p className="mt-2 text-sm text-red-700">
          The transaction data could not be loaded from the SmartPOS API.
        </p>

        <button
          type="button"
          onClick={() => refetch()}
          className="mt-4 inline-flex items-center gap-2 rounded-lg bg-red-700 px-4 py-2 text-sm font-medium text-white transition hover:bg-red-800"
        >
          <RefreshCw size={16} />
          Try Again
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-4">

      {/* Filters */}
      <div className="flex flex-col gap-3 rounded-xl border border-slate-200 bg-white p-4 shadow-sm sm:flex-row sm:items-center sm:justify-between">

        <div className="relative w-full sm:max-w-md">
          <Search
            size={18}
            className="absolute left-3 top-1/2 -translate-y-1/2 text-slate-400"
          />

          <input
            type="search"
            value={search}
            onChange={(event) =>
              setSearch(event.target.value)
            }
            placeholder="Search transactions..."
            className="h-10 w-full rounded-lg border border-slate-300 bg-white pl-10 pr-3 text-sm text-slate-900 outline-none transition placeholder:text-slate-400 focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
          />
        </div>

        <div className="flex items-center gap-3">

          <select
            value={statusFilter}
            onChange={(event) =>
              setStatusFilter(event.target.value)
            }
            className="h-10 rounded-lg border border-slate-300 bg-white px-3 text-sm font-medium text-slate-700 outline-none focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
          >
            <option value="ALL">
              All Statuses
            </option>

            <option value="PENDING">
              Pending
            </option>

            <option value="SETTLED">
              Settled
            </option>

            <option value="FAILED">
              Failed
            </option>

            <option value="REFUNDED">
              Refunded
            </option>
          </select>

          <button
            type="button"
            onClick={() => refetch()}
            disabled={isFetching}
            title="Refresh transactions"
            className="inline-flex h-10 items-center justify-center rounded-lg border border-slate-300 bg-white px-3 text-sm font-medium text-slate-700 transition hover:bg-slate-50 disabled:cursor-not-allowed disabled:opacity-50"
          >
            <RefreshCw
              size={17}
              className={isFetching ? "animate-spin" : ""}
            />
          </button>

        </div>

      </div>

      {/* Table */}
      <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">

        <div className="overflow-x-auto">

          <table className="w-full">

            <thead className="border-b border-slate-200 bg-slate-50">

              <tr>

                <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                  Reference
                </th>

                <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                  Merchant
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

            <tbody className="divide-y divide-slate-200">

              {filteredTransactions.length === 0 ? (

                <tr>

                  <td
                    colSpan={7}
                    className="px-6 py-12 text-center"
                  >
                    <p className="text-sm font-medium text-slate-700">
                      No transactions found
                    </p>

                    <p className="mt-1 text-sm text-slate-500">
                      Try changing your search or status filter.
                    </p>
                  </td>

                </tr>

              ) : (

                filteredTransactions.map(
                  (transaction: Transaction) => (

                    <tr
                      key={transaction.id}
                      onClick={() =>
                        router.push(
                          `/dashboard/transactions/${transaction.id}`
                        )
                      }
                      className="cursor-pointer transition-colors hover:bg-slate-50"
                    >

                      <td className="px-6 py-4">

                        <p className="max-w-[220px] truncate text-sm font-semibold text-slate-900">
                          {transaction.reference ??
                            transaction.id}
                        </p>

                        <p className="mt-1 max-w-[180px] truncate font-mono text-xs text-slate-500">
                          {transaction.id}
                        </p>

                      </td>

                      <td className="px-6 py-4">

                        <p className="text-sm font-medium text-slate-900">
                          {transaction.merchant?.name ??
                            transaction.merchantId ??
                            "-"}
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

                        <TransactionStatus
                          status={transaction.status}
                        />

                      </td>

                      <td className="whitespace-nowrap px-6 py-4 text-sm text-slate-600">
                        {formatDate(
                          transaction.createdAt
                        )}
                      </td>

                    </tr>

                  )
                )

              )}

            </tbody>

          </table>

        </div>

        <div className="border-t border-slate-200 px-6 py-4">

          <p className="text-sm text-slate-500">
            Showing{" "}
            <span className="font-medium text-slate-700">
              {filteredTransactions.length}
            </span>{" "}
            of{" "}
            <span className="font-medium text-slate-700">
              {data?.pagination.total ?? transactions.length}
            </span>{" "}
            transactions
          </p>

        </div>

      </div>

    </div>
  );
}

function TransactionStatus({
  status,
}: {
  status: string;
}) {
  const normalizedStatus = status?.toUpperCase() ?? "UNKNOWN";

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
      className={`inline-flex rounded-full border px-2.5 py-1 text-xs font-semibold ${statusStyles}`}
    >
      {normalizedStatus}
    </span>
  );
}
