import { PaymentIntentsTable } from "@/components/payments/payment-intents-table";

export default function PaymentIntentsPage() {
  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold tracking-tight text-slate-900">
          Payment Intents
        </h1>

        <p className="mt-2 text-sm text-slate-500">
          Monitor and manage incoming payment requests.
        </p>
      </div>

      <PaymentIntentsTable />
    </div>
  );
}
