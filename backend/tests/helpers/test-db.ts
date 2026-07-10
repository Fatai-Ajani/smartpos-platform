import { PrismaClient } from "@prisma/client";

const prisma =

  new PrismaClient();

export async function cleanDatabase() {

  const tables = [

    "Transaction",

    "PaymentIntent",

    "PaymentAttempt",

    "Settlement",

    "Wallet",

    "Customer",

    "Merchant"

  ];

  for (

    const table of tables

  ) {

    await prisma.$executeRawUnsafe(

      `TRUNCATE TABLE "${table}" RESTART IDENTITY CASCADE;`

    );

  }

}

export default prisma;
