import { Job, Worker } from "bullmq";

import {
  BullConnection
} from "./bullmq.queue.js";

import SettlementService from "../services/settlement.service.js";

export default function createSettlementWorker(
  settlementService: SettlementService
) {
  return new Worker(
    "settlements",
    async (job: Job) => {
      const {
        settlementId
      } = job.data;

      try {
        await settlementService.processSettlement(
          settlementId
        );

        return await settlementService.completeSettlement(
          settlementId
        );
      } catch (error) {
        await settlementService.failSettlement(
          settlementId
        );

        throw error;
      }
    },
    {
      connection: BullConnection
    }
  );
}
