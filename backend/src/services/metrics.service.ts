import { PrismaClient } from "@prisma/client";

export default class MetricsService {
  constructor(
    private readonly prisma: PrismaClient
  ) {}

  async getDashboardMetrics() {
    const today = new Date();

    today.setHours(0, 0, 0, 0);

    const [
      totalMerchants,
      activeTerminals,
      transactionsToday,
      revenueResult,
    ] = await Promise.all([
      this.prisma.merchant.count(),

      this.prisma.terminal.count({
        where: {
          isActive: true,
        },
      }),

      this.prisma.transaction.count({
        where: {
          createdAt: {
            gte: today,
          },
        },
      }),

      this.prisma.transaction.aggregate({
        _sum: {
          amount: true,
        },
        where: {
          status: {
            in: [
              "CAPTURED",
              "SETTLED",
            ],
          },
        },
      }),
    ]);

    return {
      totalMerchants,

      activeTerminals,

      transactionsToday,

      revenue:
        revenueResult._sum.amount ?? 0,
    };
  }
}