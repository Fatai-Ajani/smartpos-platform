"use client";

import {
  Building2,
  Search,
  ShieldCheck,
  Store,
  Users,
} from "lucide-react";

import { MerchantTable } from "@/components/merchants/merchant-table";

export default function MerchantsPage() {
  return (
    <div className="space-y-8">

      {/* Page Header */}
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <div className="flex items-center gap-2 text-sm text-slate-500">
            <Store size={16} />
            <span>Platform Management</span>
          </div>

          <h1 className="mt-2 text-3xl font-semibold tracking-tight text-slate-900">
            Merchants
          </h1>

          <p className="mt-2 max-w-2xl text-sm text-slate-500">
            Manage registered merchants, review account status, and monitor
            merchant activity across the SmartPOS platform.
          </p>
        </div>
      </div>

      {/* Merchant Overview */}
      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Total Merchants
              </p>
              <p className="mt-2 text-2xl font-semibold text-slate-900">
                —
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
                Active Merchants
              </p>
              <p className="mt-2 text-2xl font-semibold text-slate-900">
                —
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
                Verified
              </p>
              <p className="mt-2 text-2xl font-semibold text-slate-900">
                —
              </p>
            </div>

            <div className="rounded-xl bg-sky-50 p-3 text-sky-600">
              <ShieldCheck size={21} />
            </div>
          </div>
        </div>

        <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-slate-500">
                Search & Filter
              </p>
              <p className="mt-2 text-sm font-medium text-slate-700">
                Find a merchant
              </p>
            </div>

            <div className="rounded-xl bg-slate-100 p-3 text-slate-600">
              <Search size={21} />
            </div>
          </div>
        </div>

      </div>

      {/* Merchant Table */}
      <section>
        <div className="mb-4">
          <h2 className="text-lg font-semibold text-slate-900">
            All Merchants
          </h2>

          <p className="mt-1 text-sm text-slate-500">
            View and manage merchants registered on the platform.
          </p>
        </div>

        <MerchantTable />
      </section>

    </div>
  );
}
