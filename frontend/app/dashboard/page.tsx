"use client"

import {
  Activity,
  CreditCard,
  Store,
  Terminal,
  TrendingUp,
  RefreshCw,
} from "lucide-react"

import { useDashboardMetrics } from "@/features/dashboard/hooks/use-dashboard-metrics"

function formatCurrency(amount: number, currency = "USD") {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency,
  }).format(amount)
}

function StatCard({
  title,
  value,
  description,
  icon: Icon,
}: {
  title: string
  value: string
  description: string
  icon: React.ElementType
}) {
  return (
    <div className="rounded-xl border bg-white p-5 shadow-sm">
      <div className="flex items-center justify-between">
        <div>
          <p className="text-sm font-medium text-gray-500">{title}</p>
          <p className="mt-2 text-2xl font-semibold text-gray-900">
            {value}
          </p>
        </div>

        <div className="rounded-lg bg-gray-100 p-3">
          <Icon className="h-5 w-5 text-gray-700" />
        </div>
      </div>

      <p className="mt-3 text-xs text-gray-500">{description}</p>
    </div>
  )
}

export default function DashboardPage() {
  const {
    data: metrics,
    isLoading,
    isError,
    refetch,
    isFetching,
  } = useDashboardMetrics()

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold">Dashboard</h1>
          <p className="mt-1 text-sm text-gray-500">
            SmartPOS Platform overview.
          </p>
        </div>

        <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
          {Array.from({ length: 4 }).map((_, index) => (
            <div
              key={index}
              className="h-36 animate-pulse rounded-xl border bg-gray-100"
            />
          ))}
        </div>
      </div>
    )
  }

  if (isError || !metrics) {
    return (
      <div className="rounded-xl border border-red-200 bg-red-50 p-6">
        <h2 className="font-semibold text-red-900">
          Unable to load dashboard
        </h2>

        <p className="mt-2 text-sm text-red-700">
          The dashboard data could not be loaded from the SmartPOS API.
        </p>

        <button
          onClick={() => refetch()}
          className="mt-4 inline-flex items-center gap-2 rounded-lg bg-red-600 px-4 py-2 text-sm font-medium text-white hover:bg-red-700"
        >
          <RefreshCw className="h-4 w-4" />
          Try Again
        </button>
      </div>
    )
  }

  const currency = metrics.revenueSummary?.currency || "USD"

  return (
    <div className="space-y-8">
      <div className="flex items-start justify-between">
        <div>
          <h1 className="text-2xl font-semibold text-gray-900">
            Dashboard
          </h1>

          <p className="mt-1 text-sm text-gray-500">
            SmartPOS Platform overview.
          </p>
        </div>

        <button
          onClick={() => refetch()}
          disabled={isFetching}
          className="inline-flex items-center gap-2 rounded-lg border bg-white px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 disabled:opacity-50"
        >
          <RefreshCw
            className={`h-4 w-4 ${isFetching ? "animate-spin" : ""}`}
          />
          Refresh
        </button>
      </div>

      <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
        <StatCard
          title="Today's Revenue"
          value={formatCurrency(metrics.revenue, currency)}
          description="Total settled transaction revenue today"
          icon={TrendingUp}
        />

        <StatCard
          title="Transactions Today"
          value={metrics.transactionsToday.toLocaleString()}
          description="Transactions processed today"
          icon={CreditCard}
        />

        <StatCard
          title="Total Merchants"
          value={metrics.totalMerchants.toLocaleString()}
          description="Registered merchants on the platform"
          icon={Store}
        />

        <StatCard
          title="Active Terminals"
          value={metrics.activeTerminals.toLocaleString()}
          description={`${metrics.terminalCoverage}% terminal coverage`}
          icon={Terminal}
        />
      </div>

      <div className="grid gap-6 lg:grid-cols-2">
        <div className="rounded-xl border bg-white p-6 shadow-sm">
          <div className="flex items-center gap-3">
            <Activity className="h-5 w-5 text-gray-700" />

            <div>
              <h2 className="font-semibold text-gray-900">
                Platform Activity
              </h2>

              <p className="text-sm text-gray-500">
                Transactions processed today by hour.
              </p>
            </div>
          </div>

          <div className="mt-6">
            {metrics.platformActivity?.totalTransactions === 0 ? (
              <div className="flex min-h-48 items-center justify-center rounded-lg bg-gray-50">
                <div className="text-center">
                  <p className="font-medium text-gray-700">
                    No transactions today
                  </p>

                  <p className="mt-1 text-sm text-gray-500">
                    Transaction activity will appear here as payments are processed.
                  </p>
                </div>
              </div>
            ) : (
              <div className="space-y-3">
                {metrics.platformActivity.hourly.map((item) => (
                  <div
                    key={item.hour}
                    className="flex items-center gap-3"
                  >
                    <span className="w-12 text-xs text-gray-500">
                      {String(item.hour).padStart(2, "0")}:00
                    </span>

                    <div className="h-2 flex-1 overflow-hidden rounded-full bg-gray-100">
                      <div
                        className="h-full rounded-full bg-gray-900"
                        style={{
                          width: `${Math.min(
                            item.transactions * 10,
                            100
                          )}%`,
                        }}
                      />
                    </div>

                    <span className="w-8 text-right text-xs font-medium">
                      {item.transactions}
                    </span>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        <div className="rounded-xl border bg-white p-6 shadow-sm">
          <div>
            <h2 className="font-semibold text-gray-900">
              Merchant Infrastructure
            </h2>

            <p className="text-sm text-gray-500">
              Current platform merchant and terminal coverage.
            </p>
          </div>

          <div className="mt-6 space-y-5">
            <div>
              <div className="flex justify-between text-sm">
                <span className="text-gray-500">
                  Registered Merchants
                </span>

                <span className="font-semibold">
                  {metrics.merchantInfrastructure.registeredMerchants}
                </span>
              </div>
            </div>

            <div>
              <div className="flex justify-between text-sm">
                <span className="text-gray-500">
                  Active Terminals
                </span>

                <span className="font-semibold">
                  {metrics.merchantInfrastructure.activeTerminals}
                </span>
              </div>
            </div>

            <div>
              <div className="flex justify-between text-sm">
                <span className="text-gray-500">
                  Terminal Coverage
                </span>

                <span className="font-semibold">
                  {metrics.merchantInfrastructure.terminalCoverage}%
                </span>
              </div>

              <div className="mt-2 h-2 overflow-hidden rounded-full bg-gray-100">
                <div
                  className="h-full rounded-full bg-gray-900"
                  style={{
                    width: `${Math.min(
                      metrics.merchantInfrastructure.terminalCoverage,
                      100
                    )}%`,
                  }}
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="rounded-xl border bg-white p-6 shadow-sm">
        <div>
          <h2 className="font-semibold text-gray-900">
            Revenue Summary
          </h2>

          <p className="text-sm text-gray-500">
            Today&apos;s platform revenue.
          </p>
        </div>

        <div className="mt-6 flex items-end justify-between">
          <div>
            <p className="text-3xl font-semibold text-gray-900">
              {formatCurrency(
                metrics.revenueSummary.revenue,
                metrics.revenueSummary.currency
              )}
            </p>

            <p className="mt-2 text-sm text-gray-500">
              {metrics.revenueSummary.currency}
            </p>
          </div>

          <div className="rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-600">
            Today
          </div>
        </div>
      </div>
    </div>
  )
}
