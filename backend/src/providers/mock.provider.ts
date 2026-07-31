import BaseProvider, {
  CreatePaymentInput,
  RefundPaymentInput,
  VerifyPaymentInput,
  ProviderResponse,
} from "./base.provider.js";

export default class MockProvider extends BaseProvider {
  readonly name = "mock";

  async createPayment(
    input: CreatePaymentInput
  ): Promise<ProviderResponse> {
    return {
      success: true,
      message: "Mock payment created.",
      reference: input.reference,
      transactionId: "MOCK_TX_" + Date.now(),
      paymentUrl:
        "https://mock.smartpos/pay/" +
        input.reference,
      authorizationCode:
        "AUTH" + Math.floor(Math.random() * 100000),
      raw: {
        provider: "mock",
        status: "approved",
        amount: input.amount,
        currency: input.currency,
      },
    };
  }

  async verifyPayment(
    input: VerifyPaymentInput
  ): Promise<ProviderResponse> {
    return {
      success: true,
      message: "Payment verified.",
      transactionId: input.transactionId,
      raw: {
        status: "SUCCESS",
      },
    };
  }

  async refundPayment(
    input: RefundPaymentInput
  ): Promise<ProviderResponse> {
    return {
      success: true,
      message: "Refund successful.",
      transactionId: input.transactionId,
      raw: {
        refunded: true,
      },
    };
  }

  async validateWebhook(
    payload: any,
    signature: string
  ): Promise<boolean> {
    return true;
  }
}
