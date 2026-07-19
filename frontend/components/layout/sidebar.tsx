"use client";

import Link from "next/link";
import {
  LayoutDashboard,
  Users,
  Wallet,
  Settings,
  LogOut,
  Menu,
} from "lucide-react";

import { useState } from "react";
import { useAuthStore } from "@/store/auth.store";

export function Sidebar() {
  const [collapsed, setCollapsed] = useState(false);

  const logout = useAuthStore(
    (state) => state.logout
  );

  return (
    <aside
      className={`
        min-h-screen
        bg-slate-900
        text-white
        p-4
        transition-all
        duration-300
        ${collapsed ? "w-20" : "w-64"}
      `}
    >

      <div className="flex items-center justify-between mb-8">

        {!collapsed && (
          <h1 className="text-2xl font-bold">
            SmartPOS
          </h1>
        )}

        <button
          onClick={() => setCollapsed(!collapsed)}
          className="p-2 rounded hover:bg-slate-700"
        >
          <Menu size={22} />
        </button>

      </div>


      <nav className="space-y-2">

        <Link
          href="/dashboard"
          className="flex items-center gap-3 p-3 rounded hover:bg-slate-700"
        >
          <LayoutDashboard size={20} />

          {!collapsed && "Dashboard"}
        </Link>


        <Link
          href="/dashboard/users"
          className="flex items-center gap-3 p-3 rounded hover:bg-slate-700"
        >
          <Users size={20} />

          {!collapsed && "Users"}
        </Link>


        <Link
          href="/dashboard/wallets"
          className="flex items-center gap-3 p-3 rounded hover:bg-slate-700"
        >
          <Wallet size={20} />

          {!collapsed && "Wallets"}
        </Link>


        <Link
          href="/dashboard/settings"
          className="flex items-center gap-3 p-3 rounded hover:bg-slate-700"
        >
          <Settings size={20} />

          {!collapsed && "Settings"}
        </Link>

      </nav>


      <button
        onClick={logout}
        className="mt-10 flex items-center gap-3 p-3 rounded hover:bg-slate-700 w-full"
      >
        <LogOut size={20} />

        {!collapsed && "Logout"}
      </button>


    </aside>
  );
}