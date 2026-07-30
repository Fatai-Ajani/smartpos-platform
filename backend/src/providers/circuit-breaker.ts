export interface CircuitState {
  failures: number;
  openedAt?: number;
}

export default class CircuitBreaker {

  private readonly circuits =
    new Map<string, CircuitState>();

  constructor(
    private readonly failureThreshold = 5,
    private readonly cooldown = 30000
  ) {}

  canExecute(provider: string): boolean {

    const state =
      this.circuits.get(provider);

    if (!state) {
      return true;
    }

    if (
      state.failures < this.failureThreshold
    ) {
      return true;
    }

    if (!state.openedAt) {
      return false;
    }

    if (
      Date.now() - state.openedAt >
      this.cooldown
    ) {

      this.circuits.delete(provider);

      return true;

    }

    return false;

  }

  success(provider: string) {

    this.circuits.delete(provider);

  }

  failure(provider: string) {

    const state =
      this.circuits.get(provider) ?? {
        failures: 0
      };

    state.failures++;

    if (
      state.failures >=
      this.failureThreshold
    ) {

      state.openedAt =
        Date.now();

    }

    this.circuits.set(
      provider,
      state
    );

  }

  status() {

    return Array.from(
      this.circuits.entries()
    ).map(([provider, state]) => ({
      provider,
      ...state
    }));

  }

}
