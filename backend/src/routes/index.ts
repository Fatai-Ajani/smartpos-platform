import { FastifyInstance } from 'fastify';

import healthRoutes from './health.routes';
import authRoutes from './auth.routes';
import merchantRoutes from './merchant.routes';
import userRoutes from './user.routes';
import terminalRoutes from './terminal.routes';
import transactionRoutes from './transaction.routes';
import walletRoutes from './wallet.routes';
import settlementRoutes from './settlement.routes';
import kycRoutes from './kyc.routes';
import webhookRoutes from './webhook.routes';

export async function registerRoutes(app: FastifyInstance) {
  app.register(healthRoutes, { prefix: '/api/v1/health' });
  app.register(authRoutes, { prefix: '/api/v1/auth' });
  app.register(merchantRoutes, { prefix: '/api/v1/merchants' });
  app.register(userRoutes, { prefix: '/api/v1/users' });
  app.register(terminalRoutes, { prefix: '/api/v1/terminals' });
  app.register(transactionRoutes, { prefix: '/api/v1/transactions' });
  app.register(walletRoutes, { prefix: '/api/v1/wallets' });
  app.register(settlementRoutes, { prefix: '/api/v1/settlements' });
  app.register(kycRoutes, { prefix: '/api/v1/kyc' });
  app.register(webhookRoutes, { prefix: '/api/v1/webhooks' });
}
