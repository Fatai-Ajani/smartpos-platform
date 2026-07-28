"use client";

import {
  BadgeCheck,
  Building2,
  CreditCard,
  Users,
  Wallet,
  ArrowLeft,
  Landmark,
} from "lucide-react";
import { useParams, useRouter } from "next/navigation";

import { useMerchant } from "@/features/merchants/hooks/use-merchant";
import { useMerchantDashboard } from "@/features/merchants/hooks/use-merchant-dashboard";

export default function MerchantDetailsPage() {
  const params = useParams();
  const router = useRouter();

  const id = params.id as string;

  const {
    data: merchant,
    isLoading: merchantLoading,
  } = useMerchant(id);

  const {
    data: dashboard,
    isLoading: dashboardLoading,
  } = useMerchantDashboard(id);

  if (merchantLoading) {
    return (
      <div className="flex min-h-[400px] items-center justify-center">
        <p className="text-sm text-slate-500">
          Loading merchant...
        </p>
      </div>
    );
  }

  if (!merchant) {
    return (
      <div className="rounded-xl border border-slate-200 bg-white p-8 text-center">
        <h2 className="text-lg font-semibold text-slate-900">
          Merchant not found
        </h2>

        <p className="mt-2 text-sm text-slate-500">
          The merchant you are looking for could not be found.
        </p>
      </div>
    );
  }

  const formatDate = (value: string | undefined) => {
    if (!value) {
      return "-";
    }

    return new Date(value).toLocaleString();
  };

  return (
    <div className="space-y-8">

      {/* Header */}
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">

        <div>
          <button
            type="button"
            onClick={() => router.push("/dashboard/merchants")}
            className="mb-4 inline-flex items-center gap-2 text-sm font-medium text-slate-500 transition-colors hover:text-slate-900"
          >
            <ArrowLeft size={16} />
            Back to Merchants
          </button>

          <div className="flex items-center gap-2 text-sm text-slate-500">
            <Building2 size={16} />
            <span>Merchant Management</span>
          </div>

          <h1 className="mt-2 text-3xl font-semibold tracking-tight text-slate-900">
            {merchant.name}
          </h1>

          <p className="mt-2 text-sm text-slate-500">
            Merchant account overview and platform activity.
          </p>
        </div>

        <div
          className={`inline-flex w-fit items-center gap-2 rounded-full px-3 py-1.5 text-sm font-medium ${
            merchant.isVerified
              ? "bg-emerald-50 text-emerald-700"
              : "bg-amber-50 text-amber-700"
          }`}
        >
          <BadgeCheck size={16} />

          {merchant.isVerified
            ? "Verified Merchant"
            : "Verification Pending"}
        </div>

      </div>

      {/* Merchant Metrics */}
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-5">

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Transactions
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : dashboard?.transactions ?? 0}
              </p>
            </div>

            <div className="rounded-xl bg-violet-50 p-3 text-violet-600">
              <CreditCard size={21} />
            </div>
          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Active Terminals
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : dashboard?.terminals ?? 0}
              </p>
            </div>

            <div className="rounded-xl bg-emerald-50 p-3 text-emerald-600">
              <Building2 size={21} />
            </div>
          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Wallets
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : dashboard?.wallets ?? 0}
              </p>
            </div>

            <div className="rounded-xl bg-sky-50 p-3 text-sky-600">
              <Wallet size={21} />
            </div>
          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Customers
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : dashboard?.customers ?? 0}
              </p>
            </div>

            <div className="rounded-xl bg-blue-50 p-3 text-blue-600">
              <Users size={21} />
            </div>
          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Settlements
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : dashboard?.settlements ?? 0}
              </p>
            </div>

            <div className="rounded-xl bg-amber-50 p-3 text-amber-600">
              <Landmark size={21} />
            </div>
          </div>
        </div>

      </div>

      {/* Merchant Information */}
      <div className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Merchant Information
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Account and verification details.
          </p>
        </div>

        <div className="grid gap-6 p-6 md:grid-cols-2">

          <div>
            <p className="text-sm font-medium text-slate-500">
              Business Name
            </p>

            <p className="mt-1 text-sm font-medium text-slate-900">
              {merchant.name}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Legal Name
            </p>

            <p className="mt-1 text-sm text-slate-900">
              {merchant.legalName ?? "-"}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Email
            </p>

            <p className="mt-1 text-sm text-slate-900">
              {merchant.email}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Phone
            </p>

            <p className="mt-1 text-sm text-slate-900">
              {merchant.phone ?? "-"}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Business Type
            </p>

            <p className="mt-1 text-sm text-slate-900">
              {merchant.businessType ?? "-"}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Status
            </p>

            <p className="mt-1 text-sm font-medium text-slate-900">
              {merchant.status}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Currency
            </p>

            <p className="mt-1 text-sm font-medium text-slate-900">
              {merchant.currency ?? "-"}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Verification
            </p>

            <p className="mt-1 text-sm font-medium text-slate-900">
              {merchant.isVerified
                ? "Verified"
                : "Not Verified"}
            </p>
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Created
            </p>

            <p className="mt-1 text-sm text-slate-900">
              {formatDate(merchant.createdAt)}
            </p>
          </div>

        </div>

      </div>

      {/* Terminal Summary */}
      <div className="rounded-2xl border border-slate-200 bg-white shadow-sm">

        <div className="border-b border-slate-200 px-6 py-5">
          <h2 className="text-lg font-semibold text-slate-900">
            Terminals
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            Payment terminals assigned to this merchant.
          </p>
        </div>

        <div className="p-6">

          {merchant.terminals?.length ? (
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="border-b border-slate-200">
                  <tr>
                    <th className="px-4 py-3 text-left text-sm font-semibold text-slate-700">
                      Serial Number
                    </th>

                    <th className="px-4 py-3 text-left text-sm font-semibold text-slate-700">
                      Manufacturer
                    </th>

                    <th className="px-4 py-3 text-left text-sm font-semibold text-slate-700">
                      Model
                    </th>

                    <th className="px-4 py-3 text-left text-sm font-semibold text-slate-700">
                      Status
                    </th>
                  </tr>
                </thead>

                <tbody className="divide-y divide-slate-200">
                  {merchant.terminals.map((terminal) => (
                    <tr key={terminal.id}>
                      <td className="px-4 py-4 text-sm font-medium text-slate-900">
                        {terminal.serialNumber}
                      </td>

                      <td className="px-4 py-4 text-sm text-slate-700">
                        {terminal.manufacturer ?? "-"}
                      </td>

                      <td className="px-4 py-4 text-sm text-slate-700">
                        {terminal.model ?? "-"}
                      </td>

                      <td className="px-4 py-4 text-sm font-medium text-slate-700">
                        {terminal.status}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          ) : (
            <p className="text-sm text-slate-500">
              No terminals assigned to this merchant.
            </p>
          )}

        </div>

      </div>

    </div>
  );
}
