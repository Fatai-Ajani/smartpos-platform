export interface ProviderMetric {
  provider: string;
  requests: number;
  successes: number;
  failures: number;
  averageResponseTime: number;
}

export default class ProviderMetricsService {

  private readonly metrics =
    new Map<string, ProviderMetric>();

  record(
    provider: string,
    success: boolean,
    responseTime: number
  ) {

    const metric =
      this.metrics.get(provider) ?? {
        provider,
        requests: 0,
        successes: 0,
        failures: 0,
        averageResponseTime: 0
      };

    metric.requests++;

    if (success) {
      metric.successes++;
    } else {
      metric.failures++;
    }

    metric.averageResponseTime =
      metric.averageResponseTime === 0
        ? responseTime
        : (
            metric.averageResponseTime *
              (metric.requests - 1) +
            responseTime
          ) / metric.requests;

    this.metrics.set(
      provider,
      metric
    );
  }

  all() {
    return [...this.metrics.values()];
  }
}
