import {
  Building2,
  Store,
} from "lucide-react";

import { MerchantTable } from "@/components/merchants/merchant-table";

export default function MerchantsPage() {
  return (
    <div>
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <p className="mb-2 text-sm font-medium text-blue-600">
            SmartPOS Platform
          </p>

          <h1 className="text-3xl font-bold tracking-tight text-slate-900">
            Merchants
          </h1>

          <p className="mt-2 text-sm text-slate-500">
            Manage businesses connected to the SmartPOS platform.
          </p>
        </div>

        <div className="flex items-center gap-2 rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm text-slate-600 shadow-sm">
          <Building2
            size={16}
            className="text-blue-600"
          />

          Merchant network
        </div>
      </div>

      <div className="mb-6 grid gap-5 md:grid-cols-2">
        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-blue-50 p-3 text-blue-600">
              <Store size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Registered merchants
              </p>

              <p className="mt-1 text-2xl font-bold text-slate-900">
                —
              </p>
            </div>
          </div>
        </div>

        <div className="rounded-xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="flex items-center gap-3">
            <div className="rounded-lg bg-emerald-50 p-3 text-emerald-600">
              <Building2 size={20} />
            </div>

            <div>
              <p className="text-sm text-slate-500">
                Merchant management
              </p>

              <p className="mt-1 text-sm font-semibold text-slate-900">
                Active platform directory
              </p>
            </div>
          </div>
        </div>
      </div>

      <MerchantTable />
    </div>
  );
}
