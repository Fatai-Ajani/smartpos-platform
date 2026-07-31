"use client";

import { useMerchants } from "@/hooks/useMerchants";

export default function MerchantsPage(){

const {data,isLoading}=useMerchants();

if(isLoading){

return <div className="p-10">Loading...</div>;

}

return(

<div className="space-y-8">

<h1 className="text-4xl font-bold">
Merchants
</h1>

<div className="overflow-hidden rounded-xl border bg-white">

<table className="w-full">

<thead className="bg-slate-100">

<tr>

<th className="p-4 text-left">
Merchant
</th>

<th className="p-4 text-left">
Email
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

{data?.map((merchant:any)=>(

<tr
key={merchant.id}
className="border-t"
>

<td className="p-4">
{merchant.name}
</td>

<td className="p-4">
{merchant.email}
</td>

<td className="p-4">
{merchant.currency}
</td>

<td className="p-4">
{merchant.status}
</td>

</tr>

))}

</tbody>

</table>

</div>

</div>

);

}
