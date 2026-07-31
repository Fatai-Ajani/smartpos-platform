"use client";

import StatCard from "@/components/dashboard/stat-card";
import ActivityChart from "@/components/dashboard/activity-chart";
import { useDashboard } from "@/hooks/useDashboard";

export default function DashboardPage() {

  const { data, isLoading } = useDashboard();

  if (isLoading) {
    return (
      <div className="p-10">
        Loading dashboard...
      </div>
    );
  }

  return (

    <div className="space-y-8">

      <h1 className="text-4xl font-bold">
        SmartPOS Dashboard
      </h1>

      <div className="grid gap-6 md:grid-cols-2 xl:grid-cols-4">

        <StatCard
          title="Revenue"
          value={`$${data.revenue}`}
        />

        <StatCard
          title="Transactions"
          value={data.transactionsToday}
        />

        <StatCard
          title="Merchants"
          value={data.totalMerchants}
        />

        <StatCard
          title="Active Terminals"
          value={data.activeTerminals}
        />

      </div>

      <ActivityChart
        data={data.platformActivity.hourly}
      />

    </div>

  );

}
