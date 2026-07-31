"use client";

import { usePaymentIntents } from "@/hooks/usePaymentIntents";

export default function PaymentIntentsPage(){

const {data,isLoading,error}=usePaymentIntents();

if(isLoading){
return <div className="p-10">Loading...</div>;
}

if(error){
return(
<div className="p-10 text-red-600">
Unable to load Payment Intents
</div>
);
}

return(

<div className="space-y-8">

<h1 className="text-4xl font-bold">
Payment Intents
</h1>

<div className="overflow-hidden rounded-xl border bg-white">

<table className="w-full">

<thead className="bg-slate-100">

<tr>

<th className="p-4 text-left">
Reference
</th>

<th className="p-4 text-left">
Merchant
</th>

<th className="p-4 text-left">
Amount
</th>

<th className="p-4 text-left">
Currency
</th>

<th className="p-4 text-left">
Status
</th>

</tr>

</thead>

<tbody>

{data?.items?.map((intent:any)=>(

<tr
key={intent.id}
className="border-t"
>

<td className="p-4">
{intent.reference}
</td>

<td className="p-4">
{intent.merchant?.name}
</td>

<td className="p-4">
{intent.amount}
</td>

<td className="p-4">
{intent.currency}
</td>

<td className="p-4">
{intent.status}
</td>

</tr>

))}

</tbody>

</table>

</div>

</div>

);

}
