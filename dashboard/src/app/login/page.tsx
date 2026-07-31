export default function LoginPage() {
  return (
    <main className="flex min-h-screen items-center justify-center bg-slate-100">
      <div className="w-full max-w-md rounded-xl bg-white p-8 shadow-lg">

        <h1 className="mb-2 text-3xl font-bold">
          SmartPOS
        </h1>

        <p className="mb-8 text-slate-500">
          Merchant Dashboard
        </p>

        <form className="space-y-5">

          <input
            className="w-full rounded-lg border p-3"
            placeholder="Email"
          />

          <input
            type="password"
            className="w-full rounded-lg border p-3"
            placeholder="Password"
          />

          <button
            className="w-full rounded-lg bg-black p-3 text-white"
          >
            Sign In
          </button>

        </form>

      </div>
    </main>
  );
}
