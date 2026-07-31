"use client";

import Link from "next/link";
import {
  LayoutDashboard,
  CreditCard,
  Building2,
  Wallet,
  Monitor,
  Users,
  Settings,
} from "lucide-react";

const items = [
  { name: "Dashboard", href: "/dashboard", icon: LayoutDashboard },
  { name: "Transactions", href: "/dashboard/transactions", icon: CreditCard },
  { name: "Merchants", href: "/dashboard/merchants", icon: Building2 },
  { name: "Terminals", href: "/dashboard/terminals", icon: Monitor },
  { name: "Wallet", href: "/dashboard/wallet", icon: Wallet },
  { name: "Users", href: "/dashboard/users", icon: Users },
  { name: "Settings", href: "/dashboard/settings", icon: Settings },
];

export default function Sidebar() {
  return (
    <aside className="flex h-screen w-72 flex-col border-r bg-black text-white">
      <div className="border-b p-6">
        <h1 className="text-2xl font-bold">SmartPOS</h1>
        <p className="text-sm text-gray-400">
          Merchant Dashboard
        </p>
      </div>

      <nav className="flex-1 p-4 space-y-2">
        {items.map((item) => {
          const Icon = item.icon;

          return (
            <Link
              key={item.href}
              href={item.href}
              className="flex items-center gap-3 rounded-lg px-4 py-3 transition hover:bg-zinc-800"
            >
              <Icon size={20} />
              {item.name}
            </Link>
          );
        })}
      </nav>
    </aside>
  );
}
