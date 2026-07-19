
import { PrismaClient, UserRole, UserStatus } from "@prisma/client";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

async function main() {
  const passwordHash = await bcrypt.hash(
    "Admin@12345",
    10
  );

  const user = await prisma.user.upsert({
    where: {
      email: "admin@smartpos.com",
    },
    update: {},
    create: {
      email: "admin@smartpos.com",
      firstName: "Admin",
      lastName: "User",
      displayName: "SmartPOS Admin",
      passwordHash,
      role: UserRole.SUPER_ADMIN,
      status: UserStatus.ACTIVE,
      isActive: true,
      isVerified: true,
    },
  });

  console.log("Created user:", user.email);
}

main()
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });