"use client";

import { useEffect, useState } from "react";

import { useAuthStore } from "@/store/auth.store";

export function Topbar() {
  const [hydrated, setHydrated] = useState(false);

  const user = useAuthStore(
    (state) => state.user
  );

  useEffect(() => {
    setHydrated(true);
  }, []);

  return (
    <header className="h-16 bg-white border-b flex items-center justify-between px-8">

      <div>
        <h2 className="text-lg font-semibold text-slate-900">
          Dashboard
        </h2>

        <p className="text-sm text-slate-500">
          Manage your SmartPOS platform
        </p>
      </div>


      <div className="text-right">

        <p className="font-medium text-slate-900">
          {hydrated && user
            ? user.displayName
            : "Loading..."}
        </p>

        <p className="text-sm text-slate-500">
          {hydrated && user
            ? user.role
            : ""}
        </p>

      </div>

    </header>
  );
}