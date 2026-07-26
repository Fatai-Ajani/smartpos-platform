"use client";

import {
  BadgeCheck,
  Building2,
  CreditCard,
  DollarSign,
  Wallet,
} from "lucide-react";
import { useParams } from "next/navigation";

import { useMerchant } from "@/features/merchants/hooks/use-merchant";
import { useMerchantDashboard } from "@/features/merchants/hooks/use-merchant-dashboard";

export default function MerchantDetailsPage() {
  const params = useParams();
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

  const currency = merchant.currency ?? "USD";

  const formatCurrency = (value: number | undefined) => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency,
      maximumFractionDigits: 2,
    }).format(value ?? 0);
  };

  const formatNumber = (value: number | undefined) => {
    return new Intl.NumberFormat("en-US").format(value ?? 0);
  };

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
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">

            <div>
              <p className="text-sm font-medium text-slate-500">
                Revenue
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : formatCurrency(dashboard?.totalRevenue)}
              </p>
            </div>

            <div className="rounded-xl bg-blue-50 p-3 text-blue-600">
              <DollarSign size={21} />
            </div>

          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">

            <div>
              <p className="text-sm font-medium text-slate-500">
                Transactions
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : formatNumber(dashboard?.totalTransactions)}
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
                  : formatNumber(dashboard?.activeTerminals)}
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
                Wallet Balance
              </p>

              <p className="mt-2 text-2xl font-semibold text-slate-900">
                {dashboardLoading
                  ? "..."
                  : formatCurrency(dashboard?.walletBalance)}
              </p>
            </div>

            <div className="rounded-xl bg-sky-50 p-3 text-sky-600">
              <Wallet size={21} />
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
              Status
            </p>

            <p className="mt-1 text-sm font-medium capitalize text-slate-900">
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

    </div>
  );
}
