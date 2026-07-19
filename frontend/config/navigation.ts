import {
  LayoutDashboard,
  ArrowRightLeft,
  Building2,
  Wallet,
  Monitor,
  Shield,
  Settings,
  Users,
  CreditCard,
  Landmark,
  BadgeDollarSign,
  Boxes,
  ChevronRight,
} from "lucide-react";

export const navigation = [
  {
    title: "Dashboard",
    href: "/dashboard",
    icon: LayoutDashboard,
  },

  {
    title: "Operations",
    icon: ArrowRightLeft,
    children: [
      {
        title: "Transactions",
        href: "/dashboard/transactions",
        icon: CreditCard,
      },
      {
        title: "Payments",
        href: "/dashboard/payments",
        icon: BadgeDollarSign,
      },
      {
        title: "Settlements",
        href: "/dashboard/settlements",
        icon: Landmark,
      },
    ],
  },

  {
    title: "Business",
    icon: Building2,
    children: [
      {
        title: "Merchants",
        href: "/dashboard/merchants",
        icon: Building2,
      },
      {
        title: "Products",
        href: "/dashboard/products",
        icon: Boxes,
      },
    ],
  },

  {
    title: "Finance",
    icon: Wallet,
    children: [
      {
        title: "Wallets",
        href: "/dashboard/wallets",
        icon: Wallet,
      },
      {
        title: "Exchange",
        href: "/dashboard/exchange",
        icon: ArrowRightLeft,
      },
      {
        title: "Blockchain",
        href: "/dashboard/blockchain",
        icon: ChevronRight,
      },
    ],
  },

  {
    title: "Devices",
    icon: Monitor,
    children: [
      {
        title: "Terminals",
        href: "/dashboard/terminals",
        icon: Monitor,
      },
    ],
  },

  {
    title: "Administration",
    icon: Users,
    children: [
      {
        title: "Users",
        href: "/dashboard/users",
        icon: Users,
      },
    ],
  },

  {
    title: "Compliance",
    icon: Shield,
    children: [
      {
        title: "KYC",
        href: "/dashboard/kyc",
        icon: Shield,
      },
    ],
  },

  {
    title: "System",
    icon: Settings,
    children: [
      {
        title: "Settings",
        href: "/dashboard/settings",
        icon: Settings,
      },
    ],
  },
];