"use client";

import {
  ResponsiveContainer,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  CartesianGrid,
} from "recharts";

export default function ActivityChart({
  data,
}: {
  data: {
    hour: number;
    transactions: number;
  }[];
}) {
  return (
    <div className="rounded-xl border bg-white p-6">

      <h2 className="mb-6 text-xl font-semibold">
        Platform Activity
      </h2>

      <div className="h-[350px]">

        <ResponsiveContainer width="100%" height="100%">

          <BarChart data={data}>

            <CartesianGrid strokeDasharray="3 3" />

            <XAxis
              dataKey="hour"
              tickFormatter={(h) => `${h}:00`}
            />

            <YAxis />

            <Tooltip />

            <Bar
              dataKey="transactions"
              radius={[6,6,0,0]}
            />

          </BarChart>

        </ResponsiveContainer>

      </div>

    </div>
  );
}
