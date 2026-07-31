"use client";

import { useTransactions } from "@/hooks/useTransactions";

export default function TransactionsPage() {

  const { data, isLoading } = useTransactions();

  if (isLoading) {
    return <div className="p-10">Loading...</div>;
  }

  return (

    <div className="space-y-8">

      <h1 className="text-4xl font-bold">
        Transactions
      </h1>

      <div className="overflow-hidden rounded-xl border bg-white">

        <table className="w-full">

          <thead className="bg-slate-100">

            <tr>

              <th className="p-4 text-left">Reference</th>

              <th className="p-4 text-left">Merchant</th>

              <th className="p-4 text-left">Amount</th>

              <th className="p-4 text-left">Currency</th>

              <th className="p-4 text-left">Status</th>

            </tr>

          </thead>

          <tbody>

            {data?.map((tx:any)=>(

              <tr
                key={tx.id}
                className="border-t"
              >

                <td className="p-4">
                  {tx.reference}
                </td>

                <td className="p-4">
                  {tx.merchant?.name}
                </td>

                <td className="p-4">
                  {tx.amount}
                </td>

                <td className="p-4">
                  {tx.currency}
                </td>

                <td className="p-4">
                  {tx.status}
                </td>

              </tr>

            ))}

          </tbody>

        </table>

      </div>

    </div>

  );

}
