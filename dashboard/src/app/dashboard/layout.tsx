import Sidebar from "@/components/layout/sidebar";
import Topbar from "@/components/layout/topbar";

export default function DashboardLayout({
  children,
}:{
  children:React.ReactNode;
}){

  return(

    <div className="flex">

      <Sidebar/>

      <div className="flex-1">

        <Topbar/>

        <main className="min-h-screen bg-slate-100 p-8">

          {children}

        </main>

      </div>

    </div>

  );

}
