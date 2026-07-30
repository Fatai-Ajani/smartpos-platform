import ProviderMetricsService from "./provider-metrics.service.js";

export default class ProviderScoreService {

  constructor(
    private readonly metrics =
      new ProviderMetricsService()
  ) {}

  rank(
    providers: string[]
  ): string[] {

    const metrics =
      this.metrics.all();

    return [...providers].sort((a, b) => {

      const A =
        metrics.find(m => m.provider === a);

      const B =
        metrics.find(m => m.provider === b);

      const scoreA =
        this.score(A);

      const scoreB =
        this.score(B);

      return scoreB - scoreA;

    });

  }

  private score(metric?: {

    requests: number;

    successes: number;

    failures: number;

    averageResponseTime: number;

  }): number {

    if (!metric) {

      return 100;

    }

    const successRate =
      metric.requests === 0
        ? 100
        : (metric.successes / metric.requests) * 100;

    return (
      successRate -
      metric.averageResponseTime / 100
    );

  }

}
