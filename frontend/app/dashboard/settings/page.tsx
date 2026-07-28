"use client";

import {
  Bell,
  Check,
  Lock,
  Save,
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

  const user =
    useAuthStore(
      (state) => state.user
    );

  const [platformName, setPlatformName] =
    useState("SmartPOS Platform");

  const [currency, setCurrency] =
    useState("USD");

  const [timezone, setTimezone] =
    useState("UTC");

  const [saved, setSaved] =
    useState(false);

  const handleSaveGeneral = () => {
    setSaved(true);

    setTimeout(() => {
      setSaved(false);
    }, 3000);
  };

  const initials =
    user?.name
      ? user.name
          .split(" ")
          .map((part) => part[0])
          .join("")
          .slice(0, 2)
          .toUpperCase()
      : "AD";

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
            <div>

              <div className="border-b border-slate-200 p-6">
                <h2 className="text-xl font-semibold text-slate-900">
                  General Settings
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage general SmartPOS platform preferences.
                </p>
              </div>

              <div className="space-y-8 p-6">

                <div className="max-w-xl">
                  <label
                    htmlFor="platform-name"
                    className="text-sm font-medium text-slate-900"
                  >
                    Platform Name
                  </label>

                  <p className="mt-1 text-sm text-slate-500">
                    The name displayed throughout the admin platform.
                  </p>

                  <input
                    id="platform-name"
                    type="text"
                    value={platformName}
                    onChange={(event) =>
                      setPlatformName(event.target.value)
                    }
                    className="mt-4 h-10 w-full rounded-lg border border-slate-300 bg-white px-3 text-sm text-slate-900 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
                  />
                </div>

                <div className="max-w-xl">
                  <label
                    htmlFor="currency"
                    className="text-sm font-medium text-slate-900"
                  >
                    Default Currency
                  </label>

                  <p className="mt-1 text-sm text-slate-500">
                    The default currency used when displaying platform financial data.
                  </p>

                  <select
                    id="currency"
                    value={currency}
                    onChange={(event) =>
                      setCurrency(event.target.value)
                    }
                    className="mt-4 h-10 w-full rounded-lg border border-slate-300 bg-white px-3 text-sm text-slate-900 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
                  >
                    <option value="USD">
                      USD - US Dollar
                    </option>

                    <option value="NGN">
                      NGN - Nigerian Naira
                    </option>

                    <option value="EUR">
                      EUR - Euro
                    </option>

                    <option value="GBP">
                      GBP - British Pound
                    </option>
                  </select>
                </div>

                <div className="max-w-xl">
                  <label
                    htmlFor="timezone"
                    className="text-sm font-medium text-slate-900"
                  >
                    Platform Timezone
                  </label>

                  <p className="mt-1 text-sm text-slate-500">
                    Used when displaying dates and times across the admin platform.
                  </p>

                  <select
                    id="timezone"
                    value={timezone}
                    onChange={(event) =>
                      setTimezone(event.target.value)
                    }
                    className="mt-4 h-10 w-full rounded-lg border border-slate-300 bg-white px-3 text-sm text-slate-900 outline-none transition focus:border-blue-500 focus:ring-2 focus:ring-blue-100"
                  >
                    <option value="UTC">
                      UTC
                    </option>

                    <option value="Africa/Lagos">
                      Africa/Lagos
                    </option>

                    <option value="America/New_York">
                      America/New_York
                    </option>

                    <option value="Europe/London">
                      Europe/London
                    </option>
                  </select>
                </div>

              </div>

              <div className="flex items-center justify-between border-t border-slate-200 bg-slate-50 p-6">

                <div className="flex items-center gap-2 text-sm">
                  {saved ? (
                    <>
                      <Check
                        size={16}
                        className="text-emerald-600"
                      />

                      <span className="text-emerald-600">
                        Settings saved successfully.
                      </span>
                    </>
                  ) : (
                    <span className="text-slate-500">
                      Changes are currently stored for this session.
                    </span>
                  )}
                </div>

                <button
                  type="button"
                  onClick={handleSaveGeneral}
                  className="inline-flex h-10 items-center gap-2 rounded-lg bg-blue-600 px-4 text-sm font-medium text-white transition hover:bg-blue-700"
                >
                  <Save size={16} />

                  Save Changes
                </button>

              </div>

            </div>
          )}

          {/* Profile */}
          {activeSection === "profile" && (
            <div>

              <div className="border-b border-slate-200 p-6">
                <h2 className="text-xl font-semibold text-slate-900">
                  Admin Profile
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage your administrator account information.
                </p>
              </div>

              <div className="p-6">

                <div className="flex flex-col gap-6 sm:flex-row sm:items-center">

                  <div className="flex h-20 w-20 shrink-0 items-center justify-center rounded-full bg-blue-600 text-2xl font-semibold text-white">
                    {initials}
                  </div>

                  <div>
                    <h3 className="text-xl font-semibold text-slate-900">
                      {user?.name ?? "Administrator"}
                    </h3>

                    <p className="mt-1 text-sm text-slate-500">
                      {user?.email ?? "No email address available"}
                    </p>

                    <div className="mt-3 inline-flex rounded-full bg-blue-50 px-3 py-1 text-xs font-medium uppercase tracking-wide text-blue-600">
                      {user?.role ?? "Administrator"}
                    </div>
                  </div>

                </div>

                <div className="mt-8 grid gap-6 border-t border-slate-200 pt-8 md:grid-cols-2">

                  <div>
                    <label className="text-sm font-medium text-slate-700">
                      Full Name
                    </label>

                    <input
                      type="text"
                      value={user?.name ?? ""}
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-200 bg-slate-50 px-3 text-sm text-slate-700 outline-none"
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
                      className="mt-2 h-10 w-full rounded-lg border border-slate-200 bg-slate-50 px-3 text-sm text-slate-700 outline-none"
                    />
                  </div>

                  <div>
                    <label className="text-sm font-medium text-slate-700">
                      Account Role
                    </label>

                    <input
                      type="text"
                      value={user?.role ?? ""}
                      readOnly
                      className="mt-2 h-10 w-full rounded-lg border border-slate-200 bg-slate-50 px-3 text-sm capitalize text-slate-700 outline-none"
                    />
                  </div>

                  <div>
                    <label className="text-sm font-medium text-slate-700">
                      Account Status
                    </label>

                    <div className="mt-2 flex h-10 items-center rounded-lg border border-slate-200 bg-slate-50 px-3">
                      <span className="flex items-center gap-2 text-sm font-medium text-emerald-600">
                        <span className="h-2 w-2 rounded-full bg-emerald-500" />
                        Active
                      </span>
                    </div>
                  </div>

                </div>

                <div className="mt-8 rounded-lg border border-slate-200 bg-slate-50 p-4">
                  <p className="text-sm text-slate-600">
                    Profile details are currently read-only. Editing and profile updates will be connected to the admin account API.
                  </p>
                </div>

              </div>

            </div>
          )}

          {/* Security */}
          {activeSection === "security" && (
            <div>

              <div className="border-b border-slate-200 p-6">
                <h2 className="text-xl font-semibold text-slate-900">
                  Security
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage authentication and account security.
                </p>
              </div>

              <div className="p-6">
                <p className="text-sm text-slate-500">
                  Security controls will be connected to the authentication API.
                </p>
              </div>

            </div>
          )}

          {/* Notifications */}
          {activeSection === "notifications" && (
            <div>

              <div className="border-b border-slate-200 p-6">
                <h2 className="text-xl font-semibold text-slate-900">
                  Notifications
                </h2>

                <p className="mt-1 text-sm text-slate-500">
                  Manage platform notification preferences.
                </p>
              </div>

              <div className="p-6">
                <p className="text-sm text-slate-500">
                  Notification preferences will be connected to the platform configuration.
                </p>
              </div>

            </div>
          )}

        </div>
      </div>
    </div>
  );
}
