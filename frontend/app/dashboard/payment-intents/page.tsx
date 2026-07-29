"use client";

import { useState } from "react";

import { PaymentIntentsTable } from "@/components/payments/payment-intents-table";

export default function PaymentIntentsPage() {
  const [page, setPage] =
    useState(1);

  return (
    <div className="space-y-8">

      <div className="flex flex-col gap-2">
        <p className="text-sm font-medium text-blue-600">
          SmartPOS Platform
        </p>

        <h1 className="text-3xl font-bold tracking-tight text-slate-900">
          Payment Intents
        </h1>

        <p className="text-sm text-slate-500">
          Monitor and manage incoming payment requests.
        </p>
      </div>

      <div className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm">
        <div className="flex flex-col gap-2 sm:flex-row sm:items-center sm:justify-between">
          <div>
            <h2 className="text-lg font-semibold text-slate-900">
              Payment intent activity
            </h2>

            <p className="mt-1 text-sm text-slate-500">
              Review payment requests created across the platform.
            </p>
          </div>

          <div className="rounded-lg bg-slate-50 px-4 py-2 text-sm text-slate-600">
            Platform managed
          </div>
        </div>
      </div>

      <PaymentIntentsTable
        page={page}
        onPageChange={setPage}
      />

    </div>
  );
}
