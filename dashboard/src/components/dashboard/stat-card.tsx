import { Card } from "@/components/ui/card";

interface Props{
  title:string;
  value:string|number;
}

export default function StatCard({
  title,
  value,
}:Props){

  return(

    <Card className="p-6">

      <p className="text-sm text-slate-500">
        {title}
      </p>

      <h2 className="mt-3 text-3xl font-bold">
        {value}
      </h2>

    </Card>

  );

}
