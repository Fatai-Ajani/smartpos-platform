import { TransactionStatus } from "@prisma/client";

const transitions: Record<
  TransactionStatus,
  TransactionStatus[]
> = {

  /*
  |--------------------------------------------------------------------------
  | Transaction Lifecycle
  |--------------------------------------------------------------------------
  |
  | INITIATED
  |    ↓
  | PENDING
  |    ↓
  | AUTHORIZED
  |    ↓
  | CAPTURED
  |    ↓
  | SETTLED
  |
  |--------------------------------------------------------------------------
  */

  INITIATED: [
    TransactionStatus.PENDING,
    TransactionStatus.CANCELLED,
    TransactionStatus.FAILED
  ],

  PENDING: [
    TransactionStatus.AUTHORIZED,
    TransactionStatus.FAILED,
    TransactionStatus.EXPIRED,
    TransactionStatus.CANCELLED
  ],

  AUTHORIZED: [
    TransactionStatus.CAPTURED,
    TransactionStatus.VOIDED,
    TransactionStatus.FAILED
  ],

  CAPTURED: [
    TransactionStatus.SETTLED,
    TransactionStatus.REFUNDED,
    TransactionStatus.PARTIAL_REFUND,
    TransactionStatus.CHARGEBACK
  ],

  SETTLED: [
    TransactionStatus.REFUNDED,
    TransactionStatus.PARTIAL_REFUND,
    TransactionStatus.CHARGEBACK,
    TransactionStatus.REVERSED
  ],

  FAILED: [],

  REFUNDED: [],

  PARTIAL_REFUND: [],

  VOIDED: [],

  CANCELLED: [],

  REVERSED: [],

  CHARGEBACK: [],

  DISPUTED: [
    TransactionStatus.PENDING_REVIEW
  ],

  PENDING_REVIEW: [
    TransactionStatus.APPROVED,
    TransactionStatus.DECLINED
  ],

  APPROVED: [],

  DECLINED: [],

  EXPIRED: []

};

export default class TransactionStateMachine {

  canTransition(
    from: TransactionStatus,
    to: TransactionStatus
  ): boolean {

    return transitions[from]?.includes(to) ?? false;

  }

  assertTransition(
    from: TransactionStatus,
    to: TransactionStatus
  ): void {

    if (!this.canTransition(from, to)) {

      throw new Error(
        `Invalid transaction transition ${from} -> ${to}`
      );

    }

  }

}
