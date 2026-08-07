"use client";

import Link from "next/link";
import { Search } from "lucide-react";
import { useMemo, useState } from "react";

import { useMerchants } from "@/features/merchants/hooks/use-merchants";

export function MerchantTable() {
  const {
    data,
    isLoading,
    isError,
  } = useMerchants();

  const [search, setSearch] = useState("");
  const [statusFilter, setStatusFilter] = useState("ALL");

  const filteredMerchants = useMemo(() => {
    const merchants = data?.items ?? [];
    const query = search.trim().toLowerCase();

    return merchants.filter((merchant) => {
      const status = merchant.status?.toUpperCase() ?? "";

      const matchesStatus =
        statusFilter === "ALL" ||
        status === statusFilter;

      if (!matchesStatus) {
        return false;
      }

      if (!query) {
        return true;
      }

      const searchableValues = [
        merchant.id,
        merchant.name,
        merchant.legalName,
        merchant.businessType,
        merchant.email,
        merchant.phone,
        merchant.currency,
        merchant.timezone,
      ];

      return searchableValues.some((value) =>
        String(value ?? "")
          .toLowerCase()
          .includes(query)
      );
    });
  }, [data, search, statusFilter]);

  const merchants = data?.items ?? [];

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-center shadow-sm">
        <p className="text-sm text-slate-600">
          Loading merchants...
        </p>
      </div>
    );
  }

  if (isError) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-8 text-center text-sm text-red-700">
        Unable to load merchants.
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="flex flex-col gap-3 rounded-xl border border-slate-200 bg-white p-4 shadow-sm md:flex-row">
        <div className="relative flex-1">
          <Search className="pointer-events-none absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-slate-400" />

          <input
            type="text"
            value={search}
            onChange={(event) =>
              setSearch(event.target.value)
            }
            placeholder="Search merchants..."
            className="w-full rounded-lg border border-slate-200 bg-white py-2.5 pl-10 pr-4 text-sm text-slate-900 outline-none transition focus:border-slate-400 focus:ring-2 focus:ring-slate-100"
          />
        </div>

        <select
          value={statusFilter}
          onChange={(event) =>
            setStatusFilter(event.target.value)
          }
          className="rounded-lg border border-slate-200 bg-white px-4 py-2.5 text-sm font-medium text-slate-700 outline-none focus:border-slate-400 focus:ring-2 focus:ring-slate-100"
        >
          <option value="ALL">
            All Statuses
          </option>

          <option value="ACTIVE">
            Active
          </option>

          <option value="SUSPENDED">
            Suspended
          </option>

          <option value="INACTIVE">
            Inactive
          </option>
        </select>
      </div>

      <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="border-b border-slate-200 bg-slate-50">
              <tr>
                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Merchant
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Business Type
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Contact
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Terminals
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Status
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Verified
                </th>

                <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
                  Created
                </th>
              </tr>
            </thead>

            <tbody className="divide-y divide-slate-200">
              {filteredMerchants.length === 0 ? (
                <tr>
                  <td
                    colSpan={7}
                    className="px-6 py-10 text-center text-sm text-slate-500"
                  >
                    No merchants found.
                  </td>
                </tr>
              ) : (
                filteredMerchants.map((merchant) => {
                  const status =
                    merchant.status?.toUpperCase() ??
                    "UNKNOWN";

                  const statusStyles =
                    status === "ACTIVE"
                      ? "border-emerald-200 bg-emerald-50 text-emerald-700"
                      : status === "SUSPENDED"
                        ? "border-amber-200 bg-amber-50 text-amber-700"
                        : "border-slate-200 bg-slate-100 text-slate-700";

                  return (
                    <tr
                      key={merchant.id}
                      className="transition-colors hover:bg-slate-50"
                    >
                      <td className="px-6 py-4">
                        <Link
                          href={`/dashboard/merchants/${merchant.id}`}
                          className="block"
                        >
                          <p className="font-semibold text-blue-600 hover:text-blue-800 hover:underline">
                            {merchant.name}
                          </p>

                          <p className="mt-1 font-mono text-xs text-slate-500">
                            {merchant.id}
                          </p>
                        </Link>
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-700">
                        {merchant.businessType ?? "-"}
                      </td>

                      <td className="px-6 py-4">
                        <p className="text-sm text-slate-900">
                          {merchant.email ?? "-"}
                        </p>

                        <p className="mt-1 text-xs text-slate-500">
                          {merchant.phone ?? "-"}
                        </p>
                      </td>

                      <td className="px-6 py-4 text-sm font-medium text-slate-700">
                        {merchant.terminals?.length ?? 0}
                      </td>

                      <td className="px-6 py-4">
                        <span
                          className={`inline-flex rounded-full border px-3 py-1 text-xs font-semibold ${statusStyles}`}
                        >
                          {status}
                        </span>
                      </td>

                      <td className="px-6 py-4">
                        {merchant.isVerified ? (
                          <span className="inline-flex rounded-full border border-blue-200 bg-blue-50 px-3 py-1 text-xs font-semibold text-blue-700">
                            Verified
                          </span>
                        ) : (
                          <span className="text-sm text-slate-500">
                            —
                          </span>
                        )}
                      </td>

                      <td className="px-6 py-4 text-sm text-slate-600">
                        {formatDate(
                          merchant.createdAt
                        )}
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>

        <div className="border-t border-slate-200 px-6 py-4">
          <p className="text-sm text-slate-500">
            Showing{" "}
            <span className="font-medium text-slate-700">
              {filteredMerchants.length}
            </span>{" "}
            of{" "}
            <span className="font-medium text-slate-700">
              {merchants.length}
            </span>{" "}
            merchants
          </p>
        </div>
      </div>
    </div>
  );
}

function formatDate(
  value?: string | null
) {
  if (!value) {
    return "-";
  }

  const date = new Date(value);

  if (Number.isNaN(date.getTime())) {
    return "-";
  }

  return date.toLocaleDateString();
}
