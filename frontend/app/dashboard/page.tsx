"use client";

import {
  CreditCard,
  DollarSign,
  Users,
  Activity,
  ArrowUpRight,
  ArrowDownRight,
} from "lucide-react";

import { StatCard } from "@/components/dashboard/stat-card";
import { TransactionsTable } from "@/components/dashboard/transactions-table";

import { useDashboardMetrics } from "@/features/dashboard/hooks/use-dashboard-metrics";

export default function DashboardPage() {
  const {
    data,
    isLoading,
  } = useDashboardMetrics();

  const revenue = Number(data?.revenue ?? 0);
  const transactions = Number(data?.transactionsToday ?? 0);
  const merchants = Number(data?.totalMerchants ?? 0);

  return (
    <div>

          {/* Page Header */}
          <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">

            <div>
              <p className="mb-2 text-sm font-medium text-blue-600">
                SmartPOS Platform
              </p>

              <h1 className="text-3xl font-bold tracking-tight text-slate-900">
                Dashboard
              </h1>

              <p className="mt-2 text-sm text-slate-500">
                Monitor platform activity, payments, and merchant operations.
              </p>
            </div>

            <div className="flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm text-slate-600 shadow-sm">
              <Activity size={16} className="text-blue-600" />
              <span>Platform overview</span>
            </div>

          </div>

          {/* Overview Cards */}
          <div className="grid gap-5 md:grid-cols-3">

            <StatCard
              title="Revenue Today"
              value={
                isLoading
                  ? "..."
                  : `$${revenue.toLocaleString()}`
              }
              icon={<DollarSign size={24} />}
            />

            <StatCard
              title="Transactions Today"
              value={
                isLoading
                  ? "..."
                  : transactions.toLocaleString()
              }
              icon={<CreditCard size={24} />}
            />

            <StatCard
              title="Total Merchants"
              value={
                isLoading
                  ? "..."
                  : merchants.toLocaleString()
              }
              icon={<Users size={24} />}
            />

          </div>

          {/* Quick Metrics */}
          <div className="mt-8 grid gap-5 lg:grid-cols-2">

            <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

              <div className="flex items-center justify-between">

                <div>
                  <p className="text-sm font-medium text-slate-500">
                    Transaction Activity
                  </p>

                  <h2 className="mt-2 text-xl font-semibold text-slate-900">
                    Today&apos;s payment volume
                  </h2>
                </div>

                <div className="rounded-lg bg-blue-50 p-3 text-blue-600">
                  <ArrowUpRight size={20} />
                </div>

              </div>

              <div className="mt-6 flex items-end justify-between">

                <div>
                  <p className="text-3xl font-bold text-slate-900">
                    {isLoading
                      ? "..."
                      : transactions.toLocaleString()}
                  </p>

                  <p className="mt-1 text-sm text-slate-500">
                    Transactions processed today
                  </p>
                </div>

                <span className="flex items-center gap-1 text-sm font-medium text-emerald-600">
                  <ArrowUpRight size={16} />
                  Active
                </span>

              </div>

            </div>

            <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">

              <div className="flex items-center justify-between">

                <div>
                  <p className="text-sm font-medium text-slate-500">
                    Merchant Network
                  </p>

                  <h2 className="mt-2 text-xl font-semibold text-slate-900">
                    Active merchant base
                  </h2>
                </div>

                <div className="rounded-lg bg-slate-100 p-3 text-slate-700">
                  <Users size={20} />
                </div>

              </div>

              <div className="mt-6 flex items-end justify-between">

                <div>
                  <p className="text-3xl font-bold text-slate-900">
                    {isLoading
                      ? "..."
                      : merchants.toLocaleString()}
                  </p>

                  <p className="mt-1 text-sm text-slate-500">
                    Merchants registered on the platform
                  </p>
                </div>

                <span className="flex items-center gap-1 text-sm font-medium text-slate-500">
                  <ArrowDownRight size={16} />
                  Monitoring
                </span>

              </div>

            </div>

          </div>

          {/* Recent Transactions */}
          <div className="mt-8">

            <div className="mb-4 flex items-center justify-between">

              <div>
                <h2 className="text-xl font-semibold text-slate-900">
                  Recent Activity
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Latest payment activity across the platform.
                </p>
              </div>

            </div>

            <TransactionsTable />

          </div>

    </div>
  );
}
