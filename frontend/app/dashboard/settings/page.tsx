"use client";

import {
  Bell,
  Lock,
  Settings,
  User,
} from "lucide-react";

import { useState } from "react";

import { useAuthStore } from "@/store/auth.store";

const settingsSections = [
  {
    id: "general",
    title: "General",
    description:
      "Manage general platform preferences and configuration.",
    icon: Settings,
  },
  {
    id: "profile",
    title: "Profile",
    description:
      "Manage your administrator profile and account information.",
    icon: User,
  },
  {
    id: "security",
    title: "Security",
    description:
      "Manage password, authentication, and account security settings.",
    icon: Lock,
  },
  {
    id: "notifications",
    title: "Notifications",
    description:
      "Configure how platform alerts and notifications are handled.",
    icon: Bell,
  },
];

export default function SettingsPage() {
  const [activeSection, setActiveSection] =
    useState("general");

  const user = useAuthStore(
    (state) => state.user
  );

  return (
    <div>

      {/* Page Header */}

      <div className="mb-8">

        <p className="mb-2 text-sm font-medium text-blue-600">
          SmartPOS Platform
        </p>

        <h1 className="text-3xl font-bold tracking-tight text-slate-900">
          Settings
        </h1>

        <p className="mt-2 text-sm text-slate-500">
          Manage your platform preferences, account, security, and notifications.
        </p>

      </div>

      {/* Settings Layout */}

      <div className="grid gap-6 lg:grid-cols-[240px_1fr]">

        {/* Settings Navigation */}

        <div className="h-fit rounded-xl border border-slate-200 bg-white p-3 shadow-sm">

          <nav className="space-y-1">

            {settingsSections.map((section) => {

              const Icon = section.icon;

              const active =
                activeSection === section.id;

              return (

                <button
                  key={section.id}
                  type="button"
                  onClick={() =>
                    setActiveSection(section.id)
                  }
                  className={`flex w-full items-center gap-3 rounded-lg px-3 py-3 text-left text-sm font-medium transition ${
                    active
                      ? "bg-blue-50 text-blue-600"
                      : "text-slate-600 hover:bg-slate-50 hover:text-slate-900"
                  }`}
                >

                  <Icon size={18} />

                  <span>
                    {section.title}
                  </span>

                </button>

              );

            })}

          </nav>

        </div>

        {/* Settings Content */}

        <div className="rounded-xl border border-slate-200 bg-white shadow-sm">

          {/* General */}

          {activeSection === "general" && (

            <div className="p-6">

              <div className="border-b border-slate-200 pb-5">

                <h2 className="text-xl font-semibold text-slate-900">
                  General Settings
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage general SmartPOS platform preferences.
                </p>

              </div>

              <div className="py-6">

                <div>

                  <h3 className="font-medium text-slate-900">
                    Platform Name
                  </h3>

                  <p className="mt-1 text-sm text-slate-500">
                    The name displayed throughout the admin platform.
                  </p>

                </div>

                <div className="mt-4 max-w-xl">

                  <input
                    type="text"
                    defaultValue="SmartPOS Platform"
                    className="h-10 w-full rounded-lg border border-slate-300 bg-white px-3 text-sm text-slate-900 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
                  />

                </div>

              </div>

            </div>

          )}

          {/* Profile */}

          {activeSection === "profile" && (

            <div className="p-6">

              <div className="border-b border-slate-200 pb-5">

                <h2 className="text-xl font-semibold text-slate-900">
                  Admin Profile
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  View and manage your administrator account information.
                </p>

              </div>

              <div className="py-6">

                <div className="grid gap-6 md:grid-cols-2">

                  <div>

                    <label className="text-sm font-medium text-slate-700">
                      Full Name
                    </label>

                    <input
                      type="text"
                      value={user?.name ?? ""}
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-300 bg-slate-50 px-3 text-sm text-slate-900 outline-none"
                    />

                  </div>

                  <div>

                    <label className="text-sm font-medium text-slate-700">
                      Email Address
                    </label>

                    <input
                      type="email"
                      value={user?.email ?? ""}
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-300 bg-slate-50 px-3 text-sm text-slate-900 outline-none"
                    />

                  </div>

                  <div>

                    <label className="text-sm font-medium text-slate-700">
                      Role
                    </label>

                    <input
                      type="text"
                      value={user?.role ?? ""}
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-300 bg-slate-50 px-3 text-sm text-slate-900 outline-none"
                    />

                  </div>

                  <div>

                    <label className="text-sm font-medium text-slate-700">
                      Account Status
                    </label>

                    <input
                      type="text"
                      value="Active"
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-300 bg-slate-50 px-3 text-sm text-slate-900 outline-none"
                    />

                  </div>

                </div>

                <div className="mt-6 rounded-lg border border-slate-200 bg-slate-50 p-4">

                  <p className="text-sm font-medium text-slate-900">
                    Profile information
                  </p>

                  <p className="mt-1 text-sm text-slate-500">
                    Your account details are currently managed through the authentication system.
                  </p>

                </div>

              </div>

            </div>

          )}

          {/* Security */}

          {activeSection === "security" && (

            <div className="p-6">

              <div className="border-b border-slate-200 pb-5">

                <h2 className="text-xl font-semibold text-slate-900">
                  Security
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage authentication and account security.
                </p>

              </div>

              <div className="py-6 space-y-4">

                <div className="rounded-lg border border-slate-200 p-5">

                  <h3 className="font-medium text-slate-900">
                    Password
                  </h3>

                  <p className="mt-1 text-sm text-slate-500">
                    Password management will be connected to the authentication API.
                  </p>

                </div>

                <div className="rounded-lg border border-slate-200 p-5">

                  <h3 className="font-medium text-slate-900">
                    Authentication
                  </h3>

                  <p className="mt-1 text-sm text-slate-500">
                    Authentication and session controls will be managed through the platform authentication system.
                  </p>

                </div>

              </div>

            </div>

          )}

          {/* Notifications */}

          {activeSection === "notifications" && (

            <div className="p-6">

              <div className="border-b border-slate-200 pb-5">

                <h2 className="text-xl font-semibold text-slate-900">
                  Notifications
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage platform notification preferences.
                </p>

              </div>

              <div className="py-6 space-y-4">

                <div className="flex items-center justify-between rounded-lg border border-slate-200 p-5">

                  <div>

                    <h3 className="font-medium text-slate-900">
                      Platform Alerts
                    </h3>

                    <p className="mt-1 text-sm text-slate-500">
                      Receive important alerts about platform activity and operations.
                    </p>

                  </div>

                  <div className="h-5 w-9 rounded-full bg-blue-600 p-1">

                    <div className="h-3 w-3 rounded-full bg-white" />

                  </div>

                </div>

                <div className="flex items-center justify-between rounded-lg border border-slate-200 p-5">

                  <div>

                    <h3 className="font-medium text-slate-900">
                      Transaction Alerts
                    </h3>

                    <p className="mt-1 text-sm text-slate-500">
                      Receive notifications about important payment activity.
                    </p>

                  </div>

                  <div className="h-5 w-9 rounded-full bg-slate-300 p-1">

                    <div className="h-3 w-3 rounded-full bg-white" />

                  </div>

                </div>

              </div>

            </div>

          )}

        </div>

      </div>

    </div>
  );
}
