"use client";

import {
  Users,
  Monitor,
  CreditCard,
  DollarSign,
} from "lucide-react";

import { Sidebar } from "@/components/layout/sidebar";
import { Topbar } from "@/components/layout/topbar";
import { StatCard } from "@/components/dashboard/stat-card";

import { useDashboardMetrics } from "@/features/dashboard/hooks/use-dashboard-metrics";

export default function DashboardPage() {
  const {
    data,
    isLoading,
  } = useDashboardMetrics();

  return (
    <main className="flex min-h-screen bg-slate-100">

      <Sidebar />

      <section className="flex-1">

        <Topbar />

        <div className="p-10 text-slate-900">

          <h1 className="text-3xl font-bold">
            SmartPOS Dashboard
          </h1>

          <p className="mt-4 text-slate-600">
            Welcome to your dashboard.
          </p>


          <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6 mt-8">

            <StatCard
              title="Total Merchants"
              value={
                isLoading
                  ? "..."
                  : String(data?.totalMerchants ?? 0)
              }
              icon={<Users size={28} />}
            />


            <StatCard
              title="Active Terminals"
              value={
                isLoading
                  ? "..."
                  : String(data?.activeTerminals ?? 0)
              }
              icon={<Monitor size={28} />}
            />


            <StatCard
              title="Transactions Today"
              value={
                isLoading
                  ? "..."
                  : String(data?.transactionsToday ?? 0)
              }
              icon={<CreditCard size={28} />}
            />


            <StatCard
              title="Revenue"
              value={
                isLoading
                  ? "..."
                  : `$${Number(data?.revenue ?? 0).toLocaleString()}`
              }
              icon={<DollarSign size={28} />}
            />

          </div>

        </div>

      </section>

    </main>
  );
}