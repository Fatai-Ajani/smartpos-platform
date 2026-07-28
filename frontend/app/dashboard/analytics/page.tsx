"use client";

import {
  Activity,
  CreditCard,
  DollarSign,
  Store,
  Terminal,
} from "lucide-react";

import { StatCard } from "@/components/dashboard/stat-card";
import { useDashboardMetrics } from "@/features/dashboard/hooks/use-dashboard-metrics";

export default function AnalyticsPage() {
  const {
    data,
    isLoading,
    isError,
  } = useDashboardMetrics();

  const totalMerchants =
    Number(data?.totalMerchants ?? 0);

  const activeTerminals =
    Number(data?.activeTerminals ?? 0);

  const transactionsToday =
    Number(data?.transactionsToday ?? 0);

  const revenue =
    Number(data?.revenue ?? 0);

  return (
    <div className="space-y-8">

      {/* Page Header */}

      <div>
        <p className="mb-2 text-sm font-medium text-blue-600">
          SmartPOS Platform
        </p>

        <h1 className="text-3xl font-bold tracking-tight text-slate-900">
          Analytics
        </h1>

        <p className="mt-2 text-sm text-slate-500">
          Monitor platform performance, merchant activity, and payment operations.
        </p>
      </div>

      {/* Error State */}

      {isError && (
        <div className="rounded-xl border border-red-200 bg-red-50 p-4 text-sm text-red-700">
          Unable to load analytics data. Please check the API connection and try again.
        </div>
      )}

      {/* Overview */}

      <div className="grid gap-5 sm:grid-cols-2 xl:grid-cols-4">

        <StatCard
          title="Revenue Today"
          value={
            isLoading
              ? "..."
              : `$${revenue.toLocaleString("en-US")}`
          }
          icon={<DollarSign size={24} />}
        />

        <StatCard
          title="Transactions Today"
          value={
            isLoading
              ? "..."
              : transactionsToday.toLocaleString("en-US")
          }
          icon={<CreditCard size={24} />}
        />

        <StatCard
          title="Total Merchants"
          value={
            isLoading
              ? "..."
              : totalMerchants.toLocaleString("en-US")
          }
          icon={<Store size={24} />}
        />

        <StatCard
          title="Active Terminals"
          value={
            isLoading
              ? "..."
              : activeTerminals.toLocaleString("en-US")
          }
          icon={<Terminal size={24} />}
        />

      </div>

      {/* Platform Activity */}

      <div className="grid gap-6 lg:grid-cols-2">

        <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

          <div className="flex items-start justify-between">

            <div>
              <p className="text-sm font-medium text-slate-500">
                Platform Activity
              </p>

              <h2 className="mt-2 text-xl font-semibold text-slate-900">
                Today&apos;s transaction activity
              </h2>
            </div>

            <div className="rounded-lg bg-blue-50 p-3 text-blue-600">
              <Activity size={20} />
            </div>

          </div>

          <div className="mt-8">

            <p className="text-4xl font-bold text-slate-900">
              {isLoading
                ? "..."
                : transactionsToday.toLocaleString("en-US")}
            </p>

            <p className="mt-2 text-sm text-slate-500">
              Transactions recorded today across the platform.
            </p>

          </div>

          {transactionsToday === 0 && !isLoading && (
            <div className="mt-6 rounded-lg bg-slate-50 p-4 text-sm text-slate-600">
              No transactions have been recorded today yet.
            </div>
          )}

        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

          <div className="flex items-start justify-between">

            <div>
              <p className="text-sm font-medium text-slate-500">
                Merchant Infrastructure
              </p>

              <h2 className="mt-2 text-xl font-semibold text-slate-900">
                Platform network status
              </h2>
            </div>

            <div className="rounded-lg bg-slate-100 p-3 text-slate-700">
              <Terminal size={20} />
            </div>

          </div>

          <div className="mt-8 space-y-5">

            <div className="flex items-center justify-between">

              <span className="text-sm text-slate-500">
                Registered merchants
              </span>

              <span className="font-semibold text-slate-900">
                {isLoading
                  ? "..."
                  : totalMerchants.toLocaleString("en-US")}
              </span>

            </div>

            <div className="flex items-center justify-between">

              <span className="text-sm text-slate-500">
                Active terminals
              </span>

              <span className="font-semibold text-slate-900">
                {isLoading
                  ? "..."
                  : activeTerminals.toLocaleString("en-US")}
              </span>

            </div>

            <div className="h-px bg-slate-100" />

            <div className="flex items-center justify-between">

              <span className="text-sm text-slate-500">
                Terminal coverage
              </span>

              <span className="font-semibold text-slate-900">
                {isLoading
                  ? "..."
                  : totalMerchants > 0
                    ? `${Math.round(
                        (activeTerminals / totalMerchants) * 100
                      )}%`
                    : "0%"}
              </span>

            </div>

          </div>

        </div>

      </div>

      {/* Revenue Summary */}

      <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

        <div className="flex items-center gap-3">

          <div className="rounded-lg bg-emerald-50 p-3 text-emerald-600">
            <DollarSign size={20} />
          </div>

          <div>
            <p className="text-sm font-medium text-slate-500">
              Revenue Summary
            </p>

            <h2 className="mt-1 text-xl font-semibold text-slate-900">
              Today&apos;s captured and settled revenue
            </h2>
          </div>

        </div>

        <div className="mt-6">

          <p className="text-3xl font-bold text-slate-900">
            {isLoading
              ? "..."
              : `$${revenue.toLocaleString("en-US")}`}
          </p>

          <p className="mt-2 text-sm text-slate-500">
            Revenue is calculated from captured and settled transactions recorded today.
          </p>

        </div>

      </div>

    </div>
  );
}
