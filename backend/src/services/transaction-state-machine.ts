import { TransactionStatus } from "@prisma/client";

const transitions: Record<TransactionStatus, TransactionStatus[]> = {

  INITIATED: [
    TransactionStatus.PENDING,
    TransactionStatus.CANCELLED
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
    TransactionStatus.CHARGEBACK
  ],

  FAILED: [],
  REFUNDED: [],
  PARTIAL_REFUND: [],
  VOIDED: [],
  CANCELLED: [],
  REVERSED: [],
  CHARGEBACK: [],
  DISPUTED: [],
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
  ) {

    return transitions[from].includes(to);

  }

  assertTransition(
    from: TransactionStatus,
    to: TransactionStatus
  ) {

    if (!this.canTransition(from, to)) {

      throw new Error(
        `Invalid transaction transition ${from} -> ${to}`
      );

    }

  }

}
