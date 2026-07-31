"use client";

import { Bell } from "lucide-react";

export default function Topbar() {
  return (
    <header className="flex h-16 items-center justify-between border-b bg-white px-8">

      <h2 className="text-xl font-semibold">
        SmartPOS
      </h2>

      <div className="flex items-center gap-6">

        <Bell size={20} />

        <div className="text-right">

          <p className="font-semibold">
            Admin
          </p>

          <p className="text-sm text-gray-500">
            Merchant
          </p>

        </div>

      </div>

    </header>
  );
}
