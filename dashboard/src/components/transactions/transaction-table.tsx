"use client";

import {
Table,
TableBody,
TableCell,
TableHead,
TableHeader,
TableRow,
} from "@/components/ui/table";

import type { Transaction } from "@/types/transaction";

export default function TransactionTable({
transactions,
}:{
transactions:Transaction[];
}){

return(

<div className="rounded-xl border bg-white">

<Table>

<TableHeader>

<TableRow>

<TableHead>ID</TableHead>

<TableHead>Amount</TableHead>

<TableHead>Status</TableHead>

<TableHead>Merchant</TableHead>

<TableHead>Date</TableHead>

</TableRow>

</TableHeader>

<TableBody>

{transactions.map((tx)=>(

<TableRow key={tx.id}>

<TableCell>{tx.id.slice(0,8)}</TableCell>

<TableCell>
${tx.amount}
</TableCell>

<TableCell>
{tx.status}
</TableCell>

<TableCell>
{tx.merchantId.slice(0,8)}
</TableCell>

<TableCell>
{new Date(tx.createdAt).toLocaleString()}
</TableCell>

</TableRow>

))}

</TableBody>

</Table>

</div>

);

}
