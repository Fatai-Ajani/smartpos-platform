"use client";

import Link from "next/link";

import { useMerchants } from "@/features/merchants/hooks/use-merchants";

export function MerchantTable() {
  const {
    data,
    isLoading,
  } = useMerchants();

  if (isLoading) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-6 text-slate-600">
        Loading merchants...
      </div>
    );
  }

  const merchants = data ?? [];

  return (
    <div className="overflow-hidden rounded-xl border border-slate-200 bg-white shadow-sm">

      <table className="w-full">

        <thead className="border-b border-slate-200 bg-slate-50">

          <tr>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Merchant
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Email
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Status
            </th>

            <th className="px-6 py-4 text-left text-sm font-semibold text-slate-700">
              Currency
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

          {merchants.length === 0 ? (

            <tr>

              <td
                colSpan={6}
                className="px-6 py-10 text-center text-sm text-slate-500"
              >
                No merchants found.
              </td>

            </tr>

          ) : (

            merchants.map((merchant) => (

              <tr
                key={merchant.id}
                className="transition-colors hover:bg-slate-50"
              >

                <td className="px-6 py-4 text-sm font-medium text-slate-900">

                  <Link
                    href={`/dashboard/merchants/${merchant.id}`}
                    className="text-blue-600 hover:text-blue-700 hover:underline"
                  >
                    {merchant.name}
                  </Link>

                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {merchant.email ?? "-"}
                </td>

                <td className="px-6 py-4 text-sm font-medium text-slate-900">
                  {merchant.status ?? "-"}
                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {merchant.currency ?? "-"}
                </td>

                <td className="px-6 py-4 text-sm text-slate-700">
                  {merchant.isVerified ? "Yes" : "No"}
                </td>

                <td className="px-6 py-4 text-sm text-slate-600">
                  {merchant.createdAt
                    ? new Date(
                        merchant.createdAt
                      ).toLocaleDateString()
                    : "-"}
                </td>

              </tr>

            ))

          )}

        </tbody>

      </table>

    </div>
  );
}
