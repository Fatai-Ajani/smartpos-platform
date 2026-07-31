"use client";

import { useTerminals } from "@/hooks/useTerminals";

export default function TerminalsPage(){

const {data,isLoading}=useTerminals();

if(isLoading){

return <div className="p-10">Loading...</div>;

}

return(

<div className="space-y-8">

<h1 className="text-4xl font-bold">
POS Terminals
</h1>

<div className="overflow-hidden rounded-xl border bg-white">

<table className="w-full">

<thead className="bg-slate-100">

<tr>

<th className="p-4 text-left">
Serial
</th>

<th className="p-4 text-left">
Merchant
</th>

<th className="p-4 text-left">
Status
</th>

<th className="p-4 text-left">
Created
</th>

</tr>

</thead>

<tbody>

{data?.map((terminal:any)=>(

<tr
key={terminal.id}
className="border-t"
>

<td className="p-4">
{terminal.serialNumber}
</td>

<td className="p-4">
{terminal.merchant?.name}
</td>

<td className="p-4">
{terminal.status}
</td>

<td className="p-4">
{new Date(terminal.createdAt).toLocaleString()}
</td>

</tr>

))}

</tbody>

</table>

</div>

</div>

);

}
