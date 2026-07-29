"use client";

import Link from "next/link";

import {
  Building2,
  ChevronRight,
  CircleCheck,
  CircleX,
  ShieldCheck,
} from "lucide-react";

import { useMerchants } from "@/features/merchants/hooks/use-merchants";

function formatDate(
  value?: string
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

function getStatusClasses(
  status?: string | null
) {
  switch (
    status?.toUpperCase()
  ) {
    case "ACTIVE":
      return "bg-emerald-50 text-emerald-700";

    case "SUSPENDED":
      return "bg-amber-50 text-amber-700";

    case "INACTIVE":
      return "bg-slate-100 text-slate-600";

    default:
      return "bg-slate-100 text-slate-600";
  }
}

export function MerchantTable() {
  const {
    data,
    isLoading,
    isError,
  } = useMerchants(
    1,
    20
  );

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8">
        <div className="space-y-4">
          {[1, 2, 3].map(
            (item) => (
              <div
                key={item}
                className="h-16 animate-pulse rounded-lg bg-slate-100"
              />
            )
          )}
        </div>
      </div>
    );
  }

  if (isError) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6 text-sm text-red-700">
        Unable to load merchants.
      </div>
    );
  }

  const merchants =
    data?.items ?? [];

  if (
    merchants.length === 0
  ) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-12 text-center">
        <Building2
          className="mx-auto text-slate-400"
          size={32}
        />

        <h3 className="mt-4 font-semibold text-slate-900">
          No merchants found
        </h3>

        <p className="mt-1 text-sm text-slate-500">
          There are no merchants registered on the platform yet.
        </p>
      </div>
    );
  }

  return (
    <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">
      <div className="overflow-x-auto">
        <table className="w-full min-w-[900px]">
          <thead>
            <tr className="border-b border-slate-200 bg-slate-50">
              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Merchant
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Business Type
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Contact
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Terminals
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Status
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Verified
              </th>

              <th className="px-6 py-4 text-left text-xs font-semibold uppercase tracking-wide text-slate-500">
                Created
              </th>

              <th className="px-6 py-4" />
            </tr>
          </thead>

          <tbody className="divide-y divide-slate-100">
            {merchants.map(
              (merchant) => (
                <tr
                  key={
                    merchant.id
                  }
                  className="transition hover:bg-slate-50"
                >
                  <td className="px-6 py-5">
                    <Link
                      href={`/dashboard/merchants/${merchant.id}`}
                      className="group"
                    >
                      <div className="flex items-center gap-3">
                        <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-50 text-blue-600">
                          <Building2
                            size={19}
                          />
                        </div>

                        <div>
                          <p className="font-semibold text-slate-900 group-hover:text-blue-600">
                            {
                              merchant.name
                            }
                          </p>

                          <p className="mt-1 text-xs text-slate-500">
                            {
                              merchant.id
                            }
                          </p>
                        </div>
                      </div>
                    </Link>
                  </td>

                  <td className="px-6 py-5 text-sm text-slate-600">
                    {
                      merchant.businessType ??
                      "—"
                    }
                  </td>

                  <td className="px-6 py-5">
                    <p className="text-sm text-slate-700">
                      {
                        merchant.email ??
                        "—"
                      }
                    </p>

                    <p className="mt-1 text-xs text-slate-500">
                      {
                        merchant.phone ??
                        "—"
                      }
                    </p>
                  </td>

                  <td className="px-6 py-5 text-sm text-slate-700">
                    {
                      merchant.terminals
                        ?.length ??
                      0
                    }
                  </td>

                  <td className="px-6 py-5">
                    <span
                      className={`inline-flex rounded-full px-2.5 py-1 text-xs font-semibold ${getStatusClasses(
                        merchant.status
                      )}`}
                    >
                      {
                        merchant.status ??
                        "UNKNOWN"
                      }
                    </span>
                  </td>

                  <td className="px-6 py-5">
                    {merchant.isVerified ? (
                      <CircleCheck
                        size={20}
                        className="text-emerald-600"
                      />
                    ) : (
                      <CircleX
                        size={20}
                        className="text-slate-400"
                      />
                    )}
                  </td>

                  <td className="px-6 py-5 text-sm text-slate-600">
                    {formatDate(
                      merchant.createdAt
                    )}
                  </td>

                  <td className="px-6 py-5">
                    <Link
                      href={`/dashboard/merchants/${merchant.id}`}
                      className="flex h-9 w-9 items-center justify-center rounded-lg text-slate-400 transition hover:bg-slate-100 hover:text-slate-900"
                    >
                      <ChevronRight
                        size={18}
                      />
                    </Link>
                  </td>
                </tr>
              )
            )}
          </tbody>
        </table>
      </div>

      <div className="flex items-center justify-between border-t border-slate-200 px-6 py-4">
        <p className="text-sm text-slate-500">
          Showing{" "}
          <span className="font-medium text-slate-700">
            {merchants.length}
          </span>{" "}
          of{" "}
          <span className="font-medium text-slate-700">
            {data?.pagination.total ??
              merchants.length}
          </span>{" "}
          merchants
        </p>

        <div className="flex items-center gap-2 text-sm text-slate-500">
          <ShieldCheck
            size={16}
          />

          Platform managed
        </div>
      </div>
    </div>
  );
}
