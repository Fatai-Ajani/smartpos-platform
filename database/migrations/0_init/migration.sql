-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('SUPER_ADMIN', 'ADMIN', 'MERCHANT_ADMIN', 'MERCHANT_USER', 'CASHIER', 'SUPPORT', 'VIEWER', 'ACCOUNTANT', 'DEVELOPER');

-- CreateEnum
CREATE TYPE "ReportType" AS ENUM ('DAILY', 'WEEKLY', 'MONTHLY', 'YEARLY', 'CUSTOM');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'SUSPENDED', 'PENDING');

-- CreateEnum
CREATE TYPE "PermissionType" AS ENUM ('READ', 'WRITE', 'DELETE', 'MANAGE', 'EXECUTE');

-- CreateEnum
CREATE TYPE "MerchantStatus" AS ENUM ('PENDING', 'ACTIVE', 'SUSPENDED', 'REJECTED', 'CLOSED', 'UNDER_REVIEW');

-- CreateEnum
CREATE TYPE "TerminalStatus" AS ENUM ('OFFLINE', 'ONLINE', 'MAINTENANCE', 'DECOMMISSIONED', 'UPDATING', 'ERROR');

-- CreateEnum
CREATE TYPE "WalletStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'BLOCKED', 'FROZEN', 'CLOSED');

-- CreateEnum
CREATE TYPE "WalletType" AS ENUM ('FIAT', 'CRYPTO', 'SETTLEMENT', 'RESERVE', 'HOT', 'COLD', 'OPERATIONAL');

-- CreateEnum
CREATE TYPE "TransactionStatus" AS ENUM ('INITIATED', 'PENDING', 'AUTHORIZED', 'CAPTURED', 'SETTLED', 'FAILED', 'REFUNDED', 'PARTIAL_REFUND', 'VOIDED', 'CANCELLED', 'REVERSED', 'CHARGEBACK', 'DISPUTED', 'PENDING_REVIEW', 'APPROVED', 'DECLINED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "SettlementStatus" AS ENUM ('PENDING', 'PROCESSING', 'COMPLETED', 'FAILED', 'QUEUED', 'PARTIAL', 'MANUAL_REVIEW');

-- CreateEnum
CREATE TYPE "RefundStatus" AS ENUM ('REQUESTED', 'APPROVED', 'PROCESSING', 'COMPLETED', 'FAILED', 'REJECTED');

-- CreateEnum
CREATE TYPE "ChargebackStatus" AS ENUM ('INITIATED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED', 'RESOLVED', 'ARBITRATION', 'LOST', 'WON');

-- CreateEnum
CREATE TYPE "DisputeStatus" AS ENUM ('OPEN', 'UNDER_REVIEW', 'RESPONDED', 'RESOLVED', 'CLOSED', 'ESCALATED', 'MEDIATION');

-- CreateEnum
CREATE TYPE "PaymentStatus" AS ENUM ('PENDING', 'AUTHORIZED', 'CAPTURED', 'SETTLED', 'FAILED', 'REFUNDED', 'VOIDED', 'CANCELLED', 'EXPIRED');

-- CreateEnum
CREATE TYPE "WebhookStatus" AS ENUM ('PENDING', 'DELIVERED', 'FAILED', 'RETRYING', 'EXPIRED');

-- CreateEnum
CREATE TYPE "ApiKeyStatus" AS ENUM ('ACTIVE', 'REVOKED', 'EXPIRED', 'INACTIVE');

-- CreateEnum
CREATE TYPE "CurrencyType" AS ENUM ('USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD', 'CHF', 'CNY', 'KWD', 'NGN', 'AED', 'SAR', 'BTC', 'ETH', 'USDT', 'USDC', 'BUSD', 'DAI', 'XRP', 'SOL', 'ADA', 'DOT');

-- CreateEnum
CREATE TYPE "BlockchainNetworkType" AS ENUM ('BITCOIN', 'ETHEREUM', 'BSC', 'POLYGON', 'SOLANA', 'TRON', 'AVALANCHE', 'ARBITRUM', 'OPTIMISM', 'BASE', 'CARDANO', 'RIPPLE', 'LITECOIN', 'DASH', 'MONERO', 'ZCASH', 'TEZOS', 'ALGORAND', 'NEAR', 'COSMOS');

-- CreateEnum
CREATE TYPE "CryptoAssetType" AS ENUM ('COIN', 'TOKEN', 'STABLECOIN', 'NFT', 'WRAPPED');

-- CreateEnum
CREATE TYPE "CardBrand" AS ENUM ('VISA', 'MASTERCARD', 'AMEX', 'DISCOVER', 'DINERS', 'JCB', 'UNIONPAY', 'VERVE', 'RUPAY');

-- CreateEnum
CREATE TYPE "KycStatus" AS ENUM ('NOT_STARTED', 'PENDING', 'SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED', 'EXPIRED', 'ACTION_REQUIRED');

-- CreateEnum
CREATE TYPE "AMLStatus" AS ENUM ('CLEAR', 'PENDING', 'FLAGGED', 'REVIEW', 'BLOCKED');

-- CreateEnum
CREATE TYPE "RiskLevel" AS ENUM ('LOW', 'MEDIUM', 'HIGH', 'CRITICAL');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('TRANSACTION', 'SETTLEMENT', 'SECURITY', 'MERCHANT', 'SYSTEM', 'PROMOTIONAL', 'COMPLIANCE', 'DISPUTE', 'PAYMENT');

-- CreateEnum
CREATE TYPE "NotificationChannel" AS ENUM ('EMAIL', 'SMS', 'PUSH', 'WEBHOOK', 'IN_APP', 'SLACK');

-- CreateEnum
CREATE TYPE "LogLevel" AS ENUM ('DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL');

-- CreateEnum
CREATE TYPE "DeviceStatusEnum" AS ENUM ('CONNECTED', 'DISCONNECTED', 'FAULTY', 'INACTIVE', 'UPDATING');

-- CreateEnum
CREATE TYPE "EmployeeRole" AS ENUM ('MANAGER', 'SUPERVISOR', 'CASHIER', 'ACCOUNTANT', 'ADMIN', 'SUPPORT');

-- CreateEnum
CREATE TYPE "AttendanceStatus" AS ENUM ('PRESENT', 'ABSENT', 'LATE', 'LEAVE', 'HOLIDAY', 'OVERTIME');

-- CreateEnum
CREATE TYPE "SubscriptionPlan" AS ENUM ('FREE', 'STARTER', 'PRO', 'BUSINESS', 'ENTERPRISE', 'CUSTOM');

-- CreateEnum
CREATE TYPE "SubscriptionStatus" AS ENUM ('ACTIVE', 'EXPIRED', 'CANCELLED', 'PAST_DUE', 'TRIAL', 'SUSPENDED');

-- CreateEnum
CREATE TYPE "FeatureFlag" AS ENUM ('ENABLED', 'DISABLED', 'BETA', 'DEPRECATED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "passwordHash" TEXT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "displayName" TEXT,
    "avatar" TEXT,
    "role" "UserRole" NOT NULL DEFAULT 'VIEWER',
    "status" "UserStatus",
    "lastLoginAt" TIMESTAMP(3),
    "lastLoginIP" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "isMFAEnabled" BOOLEAN NOT NULL DEFAULT false,
    "mfaSecret" TEXT,
    "backupCodes" JSONB,
    "passwordResetToken" TEXT,
    "passwordResetExpires" TIMESTAMP(3),
    "emailVerifyToken" TEXT,
    "emailVerifyExpires" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),
    "merchantId" TEXT,
    "assignedRoleId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefreshToken" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "revoked" BOOLEAN NOT NULL DEFAULT false,
    "replacedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefreshToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "deviceInfo" JSONB,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PasswordReset" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "usedAt" TIMESTAMP(3),
    "used" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PasswordReset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailVerification" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "verifiedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmailVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApiKey" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "keyHash" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "merchantId" TEXT,
    "permissions" JSONB NOT NULL,
    "status" "ApiKeyStatus" NOT NULL DEFAULT 'ACTIVE',
    "expiresAt" TIMESTAMP(3),
    "lastUsedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "ApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApiKeyUsage" (
    "id" TEXT NOT NULL,
    "apiKeyId" TEXT NOT NULL,
    "endpoint" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "responseStatus" INTEGER NOT NULL,
    "responseTime" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ApiKeyUsage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "resource" TEXT NOT NULL,
    "action" "PermissionType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "isSystem" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RolePermission" (
    "id" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,
    "permissionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPermission" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "permissionId" TEXT NOT NULL,
    "grantedBy" TEXT,
    "grantedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserPermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OAuthAccount" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "accessToken" TEXT,
    "refreshToken" TEXT,
    "expiresAt" TIMESTAMP(3),
    "tokenType" TEXT,
    "scope" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OAuthAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LoginHistory" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "location" TEXT,
    "success" BOOLEAN NOT NULL,
    "failureReason" TEXT,
    "deviceId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LoginHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Merchant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "legalName" TEXT,
    "businessType" TEXT NOT NULL,
    "registrationNumber" TEXT,
    "taxId" TEXT,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "website" TEXT,
    "timezone" TEXT NOT NULL DEFAULT 'UTC',
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "MerchantStatus" NOT NULL DEFAULT 'PENDING',
    "description" TEXT,
    "logo" TEXT,
    "contactEmail" TEXT,
    "contactPhone" TEXT,
    "addressLine1" TEXT,
    "addressLine2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Merchant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantSettings" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "receiptFooter" TEXT,
    "receiptLogo" TEXT,
    "autoSettlement" BOOLEAN NOT NULL DEFAULT true,
    "settlementThreshold" DECIMAL(18,4),
    "defaultCurrency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "timezone" TEXT NOT NULL DEFAULT 'UTC',
    "language" TEXT NOT NULL DEFAULT 'en',
    "ipWhitelist" JSONB,
    "maxTransactionAmount" DECIMAL(18,4),
    "minTransactionAmount" DECIMAL(18,4),
    "allowRefunds" BOOLEAN NOT NULL DEFAULT true,
    "allowChargebacks" BOOLEAN NOT NULL DEFAULT true,
    "allowPartialSettlement" BOOLEAN NOT NULL DEFAULT false,
    "settlementAccountId" TEXT,
    "defaultGatewayProviderId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantBranding" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "companyName" TEXT,
    "logo" TEXT,
    "favicon" TEXT,
    "primaryColor" TEXT,
    "secondaryColor" TEXT,
    "font" TEXT,
    "emailFooter" TEXT,
    "receiptHeader" TEXT,
    "receiptFooter" TEXT,
    "invoiceLogo" TEXT,
    "website" TEXT,
    "socialLinks" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantBranding_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantSubscription" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "plan" "SubscriptionPlan" NOT NULL DEFAULT 'FREE',
    "status" "SubscriptionStatus" NOT NULL DEFAULT 'ACTIVE',
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiryDate" TIMESTAMP(3),
    "trialEndsAt" TIMESTAMP(3),
    "autoRenew" BOOLEAN NOT NULL DEFAULT false,
    "amount" DECIMAL(18,4),
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "paymentMethod" TEXT,
    "lastPaymentDate" TIMESTAMP(3),
    "nextPaymentDate" TIMESTAMP(3),
    "featureLimits" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantSubscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantFeature" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "featureName" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "config" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantFeature_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantLimits" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "dailyTransactionLimit" DECIMAL(18,4),
    "weeklyTransactionLimit" DECIMAL(18,4),
    "monthlyTransactionLimit" DECIMAL(18,4),
    "dailyTransactionCount" INTEGER,
    "weeklyTransactionCount" INTEGER,
    "monthlyTransactionCount" INTEGER,
    "perTransactionMax" DECIMAL(18,4),
    "perTransactionMin" DECIMAL(18,4),
    "settlementLimit" DECIMAL(18,4),
    "cryptoConversionLimit" DECIMAL(18,4),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantLimits_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantFee" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "amount" DECIMAL(18,4),
    "rate" DECIMAL(18,6),
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "appliesTo" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantFee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantCompliance" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "riskLevel" "RiskLevel" NOT NULL DEFAULT 'LOW',
    "amlStatus" "AMLStatus" NOT NULL DEFAULT 'CLEAR',
    "kycStatus" "KycStatus" NOT NULL DEFAULT 'NOT_STARTED',
    "lastReviewDate" TIMESTAMP(3),
    "nextReviewDate" TIMESTAMP(3),
    "pepCheck" BOOLEAN NOT NULL DEFAULT false,
    "sanctionsCheck" BOOLEAN NOT NULL DEFAULT false,
    "restrictedCountries" JSONB,
    "notes" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantCompliance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantDocument" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "verificationStatus" TEXT NOT NULL,
    "rejectionReason" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "verifiedAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantContact" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "role" TEXT,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantContact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantAddress" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "addressLine2" TEXT,
    "city" TEXT NOT NULL,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantBusinessHours" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "dayOfWeek" INTEGER NOT NULL,
    "openTime" TEXT,
    "closeTime" TEXT,
    "isClosed" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantBusinessHours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantNotificationSettings" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "emailNotifications" BOOLEAN NOT NULL DEFAULT true,
    "smsNotifications" BOOLEAN NOT NULL DEFAULT false,
    "pushNotifications" BOOLEAN NOT NULL DEFAULT false,
    "webhookNotifications" BOOLEAN NOT NULL DEFAULT false,
    "transactionEmails" BOOLEAN NOT NULL DEFAULT true,
    "settlementEmails" BOOLEAN NOT NULL DEFAULT true,
    "securityEmails" BOOLEAN NOT NULL DEFAULT true,
    "promotionalEmails" BOOLEAN NOT NULL DEFAULT false,
    "complianceEmails" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantNotificationSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantSecuritySettings" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "mfaRequired" BOOLEAN NOT NULL DEFAULT false,
    "passwordPolicy" JSONB,
    "sessionTimeout" INTEGER NOT NULL DEFAULT 3600,
    "ipWhitelistEnabled" BOOLEAN NOT NULL DEFAULT false,
    "ipWhitelist" JSONB,
    "webhookSecret" TEXT,
    "apiKeyRotationDays" INTEGER NOT NULL DEFAULT 90,
    "auditLogRetentionDays" INTEGER NOT NULL DEFAULT 365,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantSecuritySettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchantWebhookSettings" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "secret" TEXT,
    "events" JSONB NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "retryCount" INTEGER NOT NULL DEFAULT 3,
    "retryDelay" INTEGER NOT NULL DEFAULT 60,
    "timeout" INTEGER NOT NULL DEFAULT 30,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MerchantWebhookSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Terminal" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "serialNumber" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "manufacturer" TEXT NOT NULL,
    "firmwareVersion" TEXT,
    "softwareVersion" TEXT,
    "status" "TerminalStatus" NOT NULL DEFAULT 'OFFLINE',
    "location" TEXT,
    "ipAddress" TEXT,
    "macAddress" TEXT,
    "lastHeartbeatAt" TIMESTAMP(3),
    "lastBootAt" TIMESTAMP(3),
    "lastTransactionAt" TIMESTAMP(3),
    "batteryLevel" INTEGER,
    "storageUsed" INTEGER,
    "memoryUsed" INTEGER,
    "terminalGroupId" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Terminal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalGroup" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TerminalGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalConfiguration" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "receiptHeader" TEXT,
    "receiptFooter" TEXT,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "timezone" TEXT NOT NULL DEFAULT 'UTC',
    "language" TEXT NOT NULL DEFAULT 'en',
    "printerEnabled" BOOLEAN NOT NULL DEFAULT true,
    "autoPrint" BOOLEAN NOT NULL DEFAULT true,
    "signatureRequired" BOOLEAN NOT NULL DEFAULT false,
    "tipsEnabled" BOOLEAN NOT NULL DEFAULT false,
    "tipPercentages" JSONB,
    "cashbackEnabled" BOOLEAN NOT NULL DEFAULT false,
    "cashbackLimit" DECIMAL(18,4),
    "offlineMode" BOOLEAN NOT NULL DEFAULT false,
    "maxOfflineTransactions" INTEGER NOT NULL DEFAULT 100,
    "settlementSchedule" TEXT,
    "gatewayOverride" TEXT,
    "theme" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TerminalConfiguration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalKey" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "keyType" TEXT NOT NULL,
    "keyHash" TEXT NOT NULL,
    "label" TEXT,
    "expiresAt" TIMESTAMP(3),
    "lastUsedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TerminalKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalHeartbeat" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "status" "TerminalStatus" NOT NULL,
    "uptime" INTEGER,
    "battery" INTEGER,
    "memoryUsage" INTEGER,
    "cpuUsage" INTEGER,
    "storageFree" INTEGER,
    "networkStatus" TEXT,
    "ipAddress" TEXT,
    "geolocation" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TerminalHeartbeat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalLog" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "level" "LogLevel" NOT NULL DEFAULT 'INFO',
    "message" TEXT NOT NULL,
    "stackTrace" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TerminalLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalSoftware" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "releaseNotes" TEXT,
    "installedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" TEXT NOT NULL,
    "checksum" TEXT,
    "fileUrl" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TerminalSoftware_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerminalLocation" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "storeName" TEXT,
    "address" TEXT,
    "latitude" DECIMAL(10,8),
    "longitude" DECIMAL(11,8),
    "city" TEXT,
    "state" TEXT,
    "country" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TerminalLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Device" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "model" TEXT,
    "serialNumber" TEXT,
    "status" "DeviceStatusEnum" NOT NULL DEFAULT 'CONNECTED',
    "ipAddress" TEXT,
    "port" INTEGER,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Device_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Printer" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "paperSize" TEXT,
    "characterSet" TEXT,
    "autoCut" BOOLEAN NOT NULL DEFAULT true,
    "lineSpacing" INTEGER,
    "printSpeed" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Printer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Scanner" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "model" TEXT,
    "resolution" TEXT,
    "scanningMode" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Scanner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CashDrawer" (
    "id" TEXT NOT NULL,
    "terminalId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "openCount" INTEGER NOT NULL DEFAULT 0,
    "lastOpenAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CashDrawer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReceiptTemplate" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "type" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ReceiptTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wallet" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "WalletType" NOT NULL DEFAULT 'FIAT',
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "balance" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "reservedBalance" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "availableBalance" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "status" "WalletStatus" NOT NULL DEFAULT 'ACTIVE',
    "address" TEXT,
    "blockchainId" TEXT,
    "encryptedPrivateKey" TEXT,
    "publicKey" TEXT,
    "bankAccountId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Wallet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WalletBalance" (
    "id" TEXT NOT NULL,
    "walletId" TEXT NOT NULL,
    "assetType" "CurrencyType" NOT NULL,
    "balance" DECIMAL(18,8) NOT NULL,
    "reserved" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "available" DECIMAL(18,8) NOT NULL,
    "snapshotAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WalletBalance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WalletAddress" (
    "id" TEXT NOT NULL,
    "walletId" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "blockchainId" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "label" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WalletAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WalletKey" (
    "id" TEXT NOT NULL,
    "walletId" TEXT NOT NULL,
    "keyType" TEXT NOT NULL,
    "encryptedKey" TEXT NOT NULL,
    "keyHash" TEXT NOT NULL,
    "label" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WalletKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WalletAudit" (
    "id" TEXT NOT NULL,
    "walletId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "balanceBefore" DECIMAL(18,8) NOT NULL,
    "balanceAfter" DECIMAL(18,8) NOT NULL,
    "reference" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WalletAudit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BankAccount" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "accountName" TEXT NOT NULL,
    "accountNumber" TEXT NOT NULL,
    "bankName" TEXT NOT NULL,
    "routingNumber" TEXT,
    "swiftCode" TEXT,
    "iban" TEXT,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "accountType" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "isVerified" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BankAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Settlement" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "batchId" TEXT,
    "walletId" TEXT NOT NULL,
    "bankAccountId" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "fee" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "netAmount" DECIMAL(18,4) NOT NULL,
    "status" "SettlementStatus" NOT NULL DEFAULT 'PENDING',
    "requestedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "processedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "reference" TEXT,
    "metadata" JSONB,
    "attemptCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Settlement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SettlementBatch" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "batchReference" TEXT NOT NULL,
    "totalAmount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "totalFees" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "totalNet" DECIMAL(18,4) NOT NULL,
    "transactionCount" INTEGER NOT NULL DEFAULT 0,
    "status" "SettlementStatus" NOT NULL DEFAULT 'PENDING',
    "processedAt" TIMESTAMP(3),
    "completedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SettlementBatch_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SettlementAttempt" (
    "id" TEXT NOT NULL,
    "settlementId" TEXT NOT NULL,
    "attemptNumber" INTEGER NOT NULL,
    "status" "SettlementStatus" NOT NULL DEFAULT 'PENDING',
    "errorMessage" TEXT,
    "response" JSONB,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SettlementAttempt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SettlementFee" (
    "id" TEXT NOT NULL,
    "settlementId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "type" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SettlementFee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SettlementSchedule" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "dayOfWeek" INTEGER,
    "dayOfMonth" INTEGER,
    "timeOfDay" TEXT,
    "minAmount" DECIMAL(18,4),
    "maxAmount" DECIMAL(18,4),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "lastRunAt" TIMESTAMP(3),
    "nextRunAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SettlementSchedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SettlementRule" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "condition" JSONB NOT NULL,
    "action" TEXT NOT NULL,
    "priority" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SettlementRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeRate" (
    "id" TEXT NOT NULL,
    "fromCurrency" "CurrencyType" NOT NULL,
    "toCurrency" "CurrencyType" NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "source" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ExchangeRate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeRateHistory" (
    "id" TEXT NOT NULL,
    "fromCurrency" "CurrencyType" NOT NULL,
    "toCurrency" "CurrencyType" NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "source" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ExchangeRateHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockchainTransaction" (
    "id" TEXT NOT NULL,
    "txHash" TEXT NOT NULL,
    "blockchainId" TEXT NOT NULL,
    "walletId" TEXT,
    "fromAddress" TEXT NOT NULL,
    "toAddress" TEXT NOT NULL,
    "amount" DECIMAL(36,18) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "fee" DECIMAL(36,18) NOT NULL DEFAULT 0,
    "gasUsed" INTEGER,
    "gasPrice" DECIMAL(36,18),
    "blockNumber" INTEGER,
    "blockHash" TEXT,
    "confirmations" INTEGER NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL,
    "nonce" INTEGER,
    "data" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BlockchainTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockchainConfirmation" (
    "id" TEXT NOT NULL,
    "txId" TEXT NOT NULL,
    "confirmations" INTEGER NOT NULL,
    "blockHash" TEXT,
    "blockTime" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BlockchainConfirmation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockchainFee" (
    "id" TEXT NOT NULL,
    "blockchainId" TEXT NOT NULL,
    "feeType" TEXT NOT NULL,
    "amount" DECIMAL(36,18) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BlockchainFee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockchainNetwork" (
    "id" TEXT NOT NULL,
    "name" "BlockchainNetworkType" NOT NULL,
    "chainId" INTEGER,
    "nativeCurrency" "CurrencyType" NOT NULL,
    "blockTime" INTEGER NOT NULL,
    "explorerUrl" TEXT,
    "rpcUrl" TEXT,
    "wsUrl" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BlockchainNetwork_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GasPrice" (
    "id" TEXT NOT NULL,
    "networkId" TEXT NOT NULL,
    "price" DECIMAL(36,18) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GasPrice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GasHistory" (
    "id" TEXT NOT NULL,
    "networkId" TEXT NOT NULL,
    "price" DECIMAL(36,18) NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GasHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "terminalId" TEXT,
    "customerId" TEXT,
    "walletId" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "TransactionStatus" NOT NULL DEFAULT 'INITIATED',
    "type" TEXT NOT NULL,
    "reference" TEXT,
    "idempotencyKey" TEXT,
    "description" TEXT,
    "gatewayTransactionId" TEXT,
    "gatewayProvider" TEXT,
    "approvalCode" TEXT,
    "paymentMethod" TEXT NOT NULL,
    "cardBrand" "CardBrand",
    "cardLastFour" TEXT,
    "cardExpiry" TEXT,
    "authCode" TEXT,
    "customerIP" TEXT,
    "customerUserAgent" TEXT,
    "metadata" JSONB,
    "feeAmount" DECIMAL(18,4),
    "feeCurrency" "CurrencyType",
    "netAmount" DECIMAL(18,4),
    "settlementStatus" "SettlementStatus" NOT NULL DEFAULT 'PENDING',
    "settlementAmount" DECIMAL(18,4),
    "settlementCurrency" "CurrencyType",
    "settlementDate" TIMESTAMP(3),
    "cryptoConversionId" TEXT,
    "cryptoAmount" DECIMAL(36,18),
    "cryptoCurrency" "CurrencyType",
    "blockchainTransactionId" TEXT,
    "paymentIntentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionItem" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "productId" TEXT,
    "sku" TEXT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "quantity" DECIMAL(10,2) NOT NULL,
    "unitPrice" DECIMAL(18,4) NOT NULL,
    "totalPrice" DECIMAL(18,4) NOT NULL,
    "discountAmount" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "taxAmount" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransactionItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionFee" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "walletId" TEXT,
    "name" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "type" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransactionFee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionTax" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "rate" DECIMAL(10,4) NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransactionTax_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionDiscount" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "type" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransactionDiscount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionMetadata" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TransactionMetadata_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionEvent" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "description" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TransactionEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionTimeline" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "step" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "message" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TransactionTimeline_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionStatusHistory" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "oldStatus" "TransactionStatus" NOT NULL,
    "newStatus" "TransactionStatus" NOT NULL,
    "changedBy" TEXT,
    "reason" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TransactionStatusHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Refund" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "RefundStatus" NOT NULL DEFAULT 'REQUESTED',
    "reason" TEXT,
    "refundReference" TEXT,
    "gatewayRefundId" TEXT,
    "processedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "refundReasonId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Refund_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefundReason" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefundReason_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chargeback" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "ChargebackStatus" NOT NULL DEFAULT 'INITIATED',
    "reason" TEXT,
    "chargebackCode" TEXT,
    "reasonCode" TEXT,
    "initiatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "resolvedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Chargeback_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChargebackEvidence" (
    "id" TEXT NOT NULL,
    "chargebackId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "fileUrl" TEXT,
    "description" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ChargebackEvidence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Dispute" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "DisputeStatus" NOT NULL DEFAULT 'OPEN',
    "type" TEXT NOT NULL,
    "reason" TEXT,
    "initiatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "resolvedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "chargebackId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Dispute_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DisputeEvidence" (
    "id" TEXT NOT NULL,
    "disputeId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "fileUrl" TEXT,
    "description" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DisputeEvidence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Authorization" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "authorizationCode" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" TEXT NOT NULL,
    "message" TEXT,
    "gatewayResponse" JSONB,
    "authorizedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Authorization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Capture" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" TEXT NOT NULL,
    "capturedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gatewayResponse" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Capture_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reversal" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "reason" TEXT,
    "status" TEXT NOT NULL,
    "reversedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gatewayResponse" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Reversal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VoidTransaction" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "reason" TEXT,
    "status" TEXT NOT NULL,
    "voidedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gatewayResponse" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VoidTransaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardPayment" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,
    "cardTokenId" TEXT,
    "cardBrand" "CardBrand" NOT NULL,
    "lastFour" TEXT NOT NULL,
    "expiryMonth" INTEGER NOT NULL,
    "expiryYear" INTEGER NOT NULL,
    "cardHolderName" TEXT,
    "bin" TEXT,
    "gatewayResponse" JSONB,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardPayment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardToken" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "customerId" TEXT,
    "token" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "cardBrand" "CardBrand" NOT NULL,
    "lastFour" TEXT NOT NULL,
    "expiryMonth" INTEGER NOT NULL,
    "expiryYear" INTEGER NOT NULL,
    "cardHolderName" TEXT,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CardBIN" (
    "id" TEXT NOT NULL,
    "bin" TEXT NOT NULL,
    "brand" "CardBrand" NOT NULL,
    "issuer" TEXT,
    "cardType" TEXT,
    "country" TEXT,
    "bankName" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CardBIN_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentMethod" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "customerId" TEXT,
    "type" TEXT NOT NULL,
    "provider" TEXT,
    "token" TEXT,
    "lastFour" TEXT,
    "expiryMonth" INTEGER,
    "expiryYear" INTEGER,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentIntent" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "customerId" TEXT,
    "paymentMethodId" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "description" TEXT,
    "clientSecret" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "PaymentIntent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentAttempt" (
    "id" TEXT NOT NULL,
    "paymentIntentId" TEXT NOT NULL,
    "transactionId" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" "PaymentStatus" NOT NULL DEFAULT 'PENDING',
    "gatewayResponse" JSONB,
    "errorMessage" TEXT,
    "attemptedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentAttempt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentProvider" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "configSchema" JSONB,
    "baseUrl" TEXT,
    "priority" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PaymentProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProviderResponse" (
    "id" TEXT NOT NULL,
    "providerId" TEXT NOT NULL,
    "requestId" TEXT,
    "statusCode" INTEGER NOT NULL,
    "body" JSONB NOT NULL,
    "headers" JSONB,
    "error" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ProviderResponse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GatewayLog" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT,
    "provider" TEXT NOT NULL,
    "endpoint" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "requestPayload" JSONB,
    "responsePayload" JSONB,
    "statusCode" INTEGER,
    "error" TEXT,
    "responseTime" INTEGER,
    "ipAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GatewayLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GatewayRequest" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT,
    "providerId" TEXT NOT NULL,
    "endpoint" TEXT NOT NULL,
    "method" TEXT NOT NULL,
    "requestBody" JSONB NOT NULL,
    "requestHeaders" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GatewayRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GatewayResponse" (
    "id" TEXT NOT NULL,
    "gatewayRequestId" TEXT NOT NULL,
    "statusCode" INTEGER NOT NULL,
    "responseBody" JSONB NOT NULL,
    "responseHeaders" JSONB NOT NULL,
    "error" TEXT,
    "responseTime" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "GatewayResponse_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Webhook" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "secret" TEXT,
    "events" JSONB NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "retryCount" INTEGER NOT NULL DEFAULT 3,
    "retryDelay" INTEGER NOT NULL DEFAULT 60,
    "timeout" INTEGER NOT NULL DEFAULT 30,
    "lastDeliveryAt" TIMESTAMP(3),
    "lastSuccessAt" TIMESTAMP(3),
    "lastFailureAt" TIMESTAMP(3),
    "failureCount" INTEGER NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Webhook_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebhookDelivery" (
    "id" TEXT NOT NULL,
    "webhookId" TEXT NOT NULL,
    "event" TEXT NOT NULL,
    "payload" JSONB NOT NULL,
    "status" "WebhookStatus" NOT NULL DEFAULT 'PENDING',
    "responseStatus" INTEGER,
    "responseBody" TEXT,
    "error" TEXT,
    "attempts" INTEGER NOT NULL DEFAULT 0,
    "deliveredAt" TIMESTAMP(3),
    "nextRetryAt" TIMESTAMP(3),
    "transactionId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebhookDelivery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebhookEvent" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "eventName" TEXT NOT NULL,
    "eventData" JSONB NOT NULL,
    "delivered" BOOLEAN NOT NULL DEFAULT false,
    "deliveredAt" TIMESTAMP(3),
    "error" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WebhookEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WebhookRetry" (
    "id" TEXT NOT NULL,
    "webhookDeliveryId" TEXT NOT NULL,
    "attemptNumber" INTEGER NOT NULL,
    "scheduledAt" TIMESTAMP(3) NOT NULL,
    "executedAt" TIMESTAMP(3),
    "status" "WebhookStatus" NOT NULL DEFAULT 'PENDING',
    "responseStatus" INTEGER,
    "error" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WebhookRetry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CryptoAsset" (
    "id" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "CryptoAssetType" NOT NULL DEFAULT 'COIN',
    "blockchainId" TEXT NOT NULL,
    "contractAddress" TEXT,
    "decimals" INTEGER NOT NULL DEFAULT 18,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CryptoAsset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CryptoConversion" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "fromCurrency" "CurrencyType" NOT NULL,
    "toCurrency" "CurrencyType" NOT NULL,
    "fromAmount" DECIMAL(18,8) NOT NULL,
    "toAmount" DECIMAL(18,8) NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "fee" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL,
    "exchangeProvider" TEXT,
    "exchangeOrderId" TEXT,
    "transactionId" TEXT,
    "walletTransferId" TEXT,
    "metadata" JSONB,
    "completedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CryptoConversion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CryptoQuote" (
    "id" TEXT NOT NULL,
    "fromCurrency" "CurrencyType" NOT NULL,
    "toCurrency" "CurrencyType" NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "quoteAmount" DECIMAL(18,8) NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "provider" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CryptoQuote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CryptoRate" (
    "id" TEXT NOT NULL,
    "baseCurrency" "CurrencyType" NOT NULL,
    "quoteCurrency" "CurrencyType" NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "source" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CryptoRate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WalletTransfer" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "fromWalletId" TEXT NOT NULL,
    "toWalletId" TEXT NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "fee" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "status" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "reference" TEXT,
    "blockchainTxId" TEXT,
    "metadata" JSONB,
    "completedAt" TIMESTAMP(3),
    "cryptoConversionId" TEXT,
    "refundId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WalletTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ColdWalletTransfer" (
    "id" TEXT NOT NULL,
    "walletTransferId" TEXT NOT NULL,
    "coldWalletAddress" TEXT NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "status" TEXT NOT NULL,
    "signedTransaction" TEXT,
    "broadcastTxHash" TEXT,
    "confirmations" INTEGER NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ColdWalletTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HotWalletTransfer" (
    "id" TEXT NOT NULL,
    "walletTransferId" TEXT NOT NULL,
    "hotWalletAddress" TEXT NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "status" TEXT NOT NULL,
    "signedTransaction" TEXT,
    "broadcastTxHash" TEXT,
    "confirmations" INTEGER NOT NULL DEFAULT 0,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HotWalletTransfer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LiquidityPool" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "assetCurrency" "CurrencyType" NOT NULL,
    "totalAmount" DECIMAL(18,8) NOT NULL,
    "reservedAmount" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "availableAmount" DECIMAL(18,8) NOT NULL,
    "minBalance" DECIMAL(18,8) NOT NULL,
    "maxBalance" DECIMAL(18,8),
    "status" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LiquidityPool_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeProvider" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "apiKey" TEXT,
    "apiSecret" TEXT,
    "baseUrl" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExchangeProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeOrder" (
    "id" TEXT NOT NULL,
    "exchangeProviderId" TEXT NOT NULL,
    "merchantId" TEXT,
    "orderId" TEXT,
    "symbol" TEXT NOT NULL,
    "side" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "price" DECIMAL(18,8),
    "amount" DECIMAL(18,8) NOT NULL,
    "filledAmount" DECIMAL(18,8) NOT NULL DEFAULT 0,
    "avgPrice" DECIMAL(18,8),
    "status" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExchangeOrder_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeTrade" (
    "id" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "tradeId" TEXT,
    "price" DECIMAL(18,8) NOT NULL,
    "amount" DECIMAL(18,8) NOT NULL,
    "total" DECIMAL(18,8) NOT NULL,
    "fee" DECIMAL(18,8) NOT NULL,
    "feeCurrency" "CurrencyType" NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ExchangeTrade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ExchangeQuote" (
    "id" TEXT NOT NULL,
    "exchangeProviderId" TEXT NOT NULL,
    "fromCurrency" "CurrencyType" NOT NULL,
    "toCurrency" "CurrencyType" NOT NULL,
    "fromAmount" DECIMAL(18,8) NOT NULL,
    "toAmount" DECIMAL(18,8) NOT NULL,
    "rate" DECIMAL(18,8) NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ExchangeQuote_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlockchainExplorer" (
    "id" TEXT NOT NULL,
    "blockchainId" TEXT NOT NULL,
    "explorerUrl" TEXT NOT NULL,
    "apiUrl" TEXT,
    "apiKey" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BlockchainExplorer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Kyc" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "status" "KycStatus" NOT NULL DEFAULT 'NOT_STARTED',
    "type" TEXT NOT NULL,
    "firstName" TEXT,
    "lastName" TEXT,
    "dob" TIMESTAMP(3),
    "nationality" TEXT,
    "address" TEXT,
    "city" TEXT,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "taxId" TEXT,
    "registrationNumber" TEXT,
    "businessName" TEXT,
    "businessType" TEXT,
    "businessAddress" TEXT,
    "riskLevel" "RiskLevel" NOT NULL DEFAULT 'LOW',
    "amlStatus" "AMLStatus" NOT NULL DEFAULT 'CLEAR',
    "pepCheck" BOOLEAN NOT NULL DEFAULT false,
    "sanctionsCheck" BOOLEAN NOT NULL DEFAULT false,
    "reviewNotes" TEXT,
    "submittedAt" TIMESTAMP(3),
    "approvedAt" TIMESTAMP(3),
    "rejectedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Kyc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KycDocument" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "verificationStatus" TEXT NOT NULL,
    "rejectionReason" TEXT,
    "uploadedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "verifiedAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KycDocument_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KycReview" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "reviewedBy" TEXT,
    "status" "KycStatus" NOT NULL,
    "notes" TEXT,
    "decision" TEXT,
    "metadata" JSONB,
    "reviewedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "KycReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IdentityVerification" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "identityNumber" TEXT,
    "documentType" TEXT NOT NULL,
    "documentNumber" TEXT,
    "documentCountry" TEXT,
    "documentExpiry" TIMESTAMP(3),
    "verificationResult" TEXT,
    "verificationData" JSONB,
    "metadata" JSONB,
    "verifiedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IdentityVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AddressVerification" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "addressLine1" TEXT,
    "addressLine2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "proofDocument" TEXT,
    "verificationResult" TEXT,
    "metadata" JSONB,
    "verifiedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AddressVerification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SanctionCheck" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "alias" TEXT,
    "matched" BOOLEAN NOT NULL,
    "riskScore" INTEGER,
    "listName" TEXT,
    "reference" TEXT,
    "metadata" JSONB,
    "checkedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SanctionCheck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PEPCheck" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "matched" BOOLEAN NOT NULL,
    "position" TEXT,
    "country" TEXT,
    "reference" TEXT,
    "metadata" JSONB,
    "checkedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PEPCheck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RiskAssessment" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    "level" "RiskLevel" NOT NULL DEFAULT 'LOW',
    "factors" JSONB,
    "recommendedAction" TEXT,
    "metadata" JSONB,
    "assessedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RiskAssessment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AMLCheck" (
    "id" TEXT NOT NULL,
    "kycId" TEXT NOT NULL,
    "status" "AMLStatus" NOT NULL DEFAULT 'CLEAR',
    "flags" JSONB,
    "riskScore" INTEGER,
    "reviewedBy" TEXT,
    "reviewNotes" TEXT,
    "metadata" JSONB,
    "checkedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reviewedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AMLCheck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplianceLog" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "details" JSONB,
    "performedBy" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ComplianceLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ComplianceReview" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "reviewType" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "findings" JSONB,
    "recommendations" JSONB,
    "reviewerId" TEXT,
    "reviewedAt" TIMESTAMP(3),
    "dueDate" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ComplianceReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "sku" TEXT NOT NULL,
    "barcode" TEXT,
    "price" DECIMAL(18,4) NOT NULL,
    "cost" DECIMAL(18,4),
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "categoryId" TEXT,
    "brandId" TEXT,
    "weight" DECIMAL(10,2),
    "dimensions" JSONB,
    "isTaxable" BOOLEAN NOT NULL DEFAULT true,
    "taxRate" DECIMAL(10,4),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "parentId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Brand" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "logo" TEXT,
    "website" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Inventory" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" DECIMAL(10,2) NOT NULL,
    "reservedQuantity" DECIMAL(10,2) NOT NULL DEFAULT 0,
    "availableQuantity" DECIMAL(10,2) NOT NULL,
    "lowStockThreshold" DECIMAL(10,2),
    "location" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryMovement" (
    "id" TEXT NOT NULL,
    "inventoryId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" DECIMAL(10,2) NOT NULL,
    "type" TEXT NOT NULL,
    "reference" TEXT,
    "note" TEXT,
    "beforeQuantity" DECIMAL(10,2) NOT NULL,
    "afterQuantity" DECIMAL(10,2) NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "InventoryMovement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryAdjustment" (
    "id" TEXT NOT NULL,
    "inventoryId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" DECIMAL(10,2) NOT NULL,
    "reason" TEXT NOT NULL,
    "approvedBy" TEXT,
    "note" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Supplier" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT,
    "address" TEXT,
    "contactPerson" TEXT,
    "taxId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purchase" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "supplierId" TEXT NOT NULL,
    "reference" TEXT,
    "purchaseDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "totalAmount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PurchaseItem" (
    "id" TEXT NOT NULL,
    "purchaseId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "quantity" DECIMAL(10,2) NOT NULL,
    "unitPrice" DECIMAL(18,4) NOT NULL,
    "totalPrice" DECIMAL(18,4) NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PurchaseItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "email" TEXT,
    "phone" TEXT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "displayName" TEXT,
    "avatar" TEXT,
    "addressLine1" TEXT,
    "addressLine2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT,
    "language" TEXT NOT NULL DEFAULT 'en',
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" TEXT NOT NULL,
    "notes" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerWallet" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "blockchainId" TEXT NOT NULL,
    "currency" "CurrencyType" NOT NULL,
    "isPrimary" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerWallet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerAddress" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "addressLine1" TEXT NOT NULL,
    "addressLine2" TEXT,
    "city" TEXT NOT NULL,
    "state" TEXT,
    "postalCode" TEXT,
    "country" TEXT NOT NULL,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "type" TEXT NOT NULL,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerDevice" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "deviceName" TEXT,
    "deviceType" TEXT,
    "os" TEXT,
    "browser" TEXT,
    "ipAddress" TEXT,
    "lastSeenAt" TIMESTAMP(3),
    "isTrusted" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerDevice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerCard" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "cardBrand" "CardBrand" NOT NULL,
    "lastFour" TEXT NOT NULL,
    "expiryMonth" INTEGER NOT NULL,
    "expiryYear" INTEGER NOT NULL,
    "cardHolderName" TEXT,
    "isDefault" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerCard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerReward" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 0,
    "totalEarned" INTEGER NOT NULL DEFAULT 0,
    "totalRedeemed" INTEGER NOT NULL DEFAULT 0,
    "tier" TEXT,
    "expiryDate" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerReward_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerLoyalty" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "loyaltyLevel" TEXT NOT NULL,
    "pointsBalance" INTEGER NOT NULL DEFAULT 0,
    "lifetimePoints" INTEGER NOT NULL DEFAULT 0,
    "totalSpent" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "totalTransactions" INTEGER NOT NULL DEFAULT 0,
    "lastTransactionAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CustomerLoyalty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerActivity" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "activityType" TEXT NOT NULL,
    "description" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CustomerActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerNotification" (
    "id" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "subject" TEXT,
    "message" TEXT NOT NULL,
    "sentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "readAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CustomerNotification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "userId" TEXT,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "role" "EmployeeRole" NOT NULL DEFAULT 'CASHIER',
    "departmentId" TEXT,
    "hireDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "terminationDate" TIMESTAMP(3),
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Department" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "managerId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attendance" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" "AttendanceStatus" NOT NULL DEFAULT 'PRESENT',
    "clockInTime" TIMESTAMP(3),
    "clockOutTime" TIMESTAMP(3),
    "totalHours" DECIMAL(10,2),
    "overtimeHours" DECIMAL(10,2),
    "notes" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Attendance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shift" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3),
    "breakDuration" INTEGER,
    "totalHours" DECIMAL(10,2),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Shift_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClockIn" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "clockInTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location" TEXT,
    "deviceId" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClockIn_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClockOut" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "clockOutTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "location" TEXT,
    "deviceId" TEXT,
    "totalHours" DECIMAL(10,2),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ClockOut_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Salary" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "baseSalary" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "payFrequency" TEXT NOT NULL,
    "effectiveDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Salary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payroll" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "basePay" DECIMAL(18,4) NOT NULL,
    "overtimePay" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "bonusPay" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "deductions" DECIMAL(18,4) NOT NULL DEFAULT 0,
    "netPay" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "status" TEXT NOT NULL,
    "paidAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Payroll_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Commission" (
    "id" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,
    "transactionId" TEXT,
    "amount" DECIMAL(18,4) NOT NULL,
    "currency" "CurrencyType" NOT NULL DEFAULT 'USD',
    "rate" DECIMAL(10,4),
    "description" TEXT,
    "paid" BOOLEAN NOT NULL DEFAULT false,
    "paidAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Commission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "userId" TEXT,
    "merchantId" TEXT,
    "transactionId" TEXT,
    "action" TEXT NOT NULL,
    "entityType" TEXT,
    "entityId" TEXT,
    "changes" JSONB,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActivityLog" (
    "id" TEXT NOT NULL,
    "userId" TEXT,
    "merchantId" TEXT,
    "activity" TEXT NOT NULL,
    "description" TEXT,
    "ipAddress" TEXT,
    "userAgent" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ActivityLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT,
    "userId" TEXT,
    "customerId" TEXT,
    "type" "NotificationType" NOT NULL DEFAULT 'SYSTEM',
    "channel" "NotificationChannel" NOT NULL DEFAULT 'IN_APP',
    "title" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "data" JSONB,
    "readAt" TIMESTAMP(3),
    "deliveredAt" TIMESTAMP(3),
    "sentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotificationLog" (
    "id" TEXT NOT NULL,
    "notificationId" TEXT NOT NULL,
    "channel" "NotificationChannel" NOT NULL,
    "status" TEXT NOT NULL,
    "error" TEXT,
    "sentAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "NotificationLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "type" "ReportType" NOT NULL DEFAULT 'DAILY',
    "name" TEXT NOT NULL,
    "parameters" JSONB,
    "data" JSONB,
    "fileUrl" TEXT,
    "format" TEXT,
    "status" TEXT NOT NULL,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "expiresAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Report_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReportExport" (
    "id" TEXT NOT NULL,
    "reportId" TEXT NOT NULL,
    "format" TEXT NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "fileSize" INTEGER,
    "generatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ReportExport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DashboardWidget" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "config" JSONB NOT NULL,
    "position" JSONB NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DashboardWidget_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SystemSetting" (
    "id" TEXT NOT NULL,
    "merchantId" TEXT,
    "key" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT,
    "isGlobal" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SystemSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SystemConfiguration" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SystemConfiguration_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Backup" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "size" INTEGER,
    "fileUrl" TEXT NOT NULL,
    "checksum" TEXT,
    "status" TEXT NOT NULL,
    "scheduled" BOOLEAN NOT NULL DEFAULT false,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "completedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Backup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BackupHistory" (
    "id" TEXT NOT NULL,
    "backupId" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "message" TEXT,
    "metadata" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BackupHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProviderMetric" (
    "id" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "requests" INTEGER NOT NULL DEFAULT 0,
    "successes" INTEGER NOT NULL DEFAULT 0,
    "failures" INTEGER NOT NULL DEFAULT 0,
    "averageResponseTime" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProviderMetric_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "User_passwordResetToken_key" ON "User"("passwordResetToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_emailVerifyToken_key" ON "User"("emailVerifyToken");

-- CreateIndex
CREATE INDEX "User_email_idx" ON "User"("email");

-- CreateIndex
CREATE INDEX "User_phone_idx" ON "User"("phone");

-- CreateIndex
CREATE INDEX "User_merchantId_idx" ON "User"("merchantId");

-- CreateIndex
CREATE INDEX "User_role_idx" ON "User"("role");

-- CreateIndex
CREATE INDEX "User_status_idx" ON "User"("status");

-- CreateIndex
CREATE INDEX "User_deletedAt_idx" ON "User"("deletedAt");

-- CreateIndex
CREATE INDEX "User_assignedRoleId_idx" ON "User"("assignedRoleId");

-- CreateIndex
CREATE UNIQUE INDEX "RefreshToken_token_key" ON "RefreshToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "RefreshToken_replacedBy_key" ON "RefreshToken"("replacedBy");

-- CreateIndex
CREATE INDEX "RefreshToken_userId_idx" ON "RefreshToken"("userId");

-- CreateIndex
CREATE INDEX "RefreshToken_expiresAt_idx" ON "RefreshToken"("expiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionId_key" ON "Session"("sessionId");

-- CreateIndex
CREATE INDEX "Session_userId_idx" ON "Session"("userId");

-- CreateIndex
CREATE INDEX "Session_expiresAt_idx" ON "Session"("expiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "PasswordReset_token_key" ON "PasswordReset"("token");

-- CreateIndex
CREATE INDEX "PasswordReset_userId_idx" ON "PasswordReset"("userId");

-- CreateIndex
CREATE INDEX "PasswordReset_expiresAt_idx" ON "PasswordReset"("expiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "EmailVerification_token_key" ON "EmailVerification"("token");

-- CreateIndex
CREATE INDEX "EmailVerification_userId_idx" ON "EmailVerification"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ApiKey_keyHash_key" ON "ApiKey"("keyHash");

-- CreateIndex
CREATE INDEX "ApiKey_userId_idx" ON "ApiKey"("userId");

-- CreateIndex
CREATE INDEX "ApiKey_merchantId_idx" ON "ApiKey"("merchantId");

-- CreateIndex
CREATE INDEX "ApiKey_keyHash_idx" ON "ApiKey"("keyHash");

-- CreateIndex
CREATE INDEX "ApiKey_status_idx" ON "ApiKey"("status");

-- CreateIndex
CREATE INDEX "ApiKeyUsage_apiKeyId_idx" ON "ApiKeyUsage"("apiKeyId");

-- CreateIndex
CREATE INDEX "ApiKeyUsage_createdAt_idx" ON "ApiKeyUsage"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "Permission_name_key" ON "Permission"("name");

-- CreateIndex
CREATE INDEX "Permission_name_idx" ON "Permission"("name");

-- CreateIndex
CREATE INDEX "Permission_resource_action_idx" ON "Permission"("resource", "action");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE INDEX "Role_name_idx" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "RolePermission_roleId_permissionId_key" ON "RolePermission"("roleId", "permissionId");

-- CreateIndex
CREATE INDEX "UserPermission_userId_idx" ON "UserPermission"("userId");

-- CreateIndex
CREATE INDEX "UserPermission_permissionId_idx" ON "UserPermission"("permissionId");

-- CreateIndex
CREATE UNIQUE INDEX "UserPermission_userId_permissionId_key" ON "UserPermission"("userId", "permissionId");

-- CreateIndex
CREATE INDEX "OAuthAccount_userId_idx" ON "OAuthAccount"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "OAuthAccount_provider_providerId_key" ON "OAuthAccount"("provider", "providerId");

-- CreateIndex
CREATE INDEX "LoginHistory_userId_idx" ON "LoginHistory"("userId");

-- CreateIndex
CREATE INDEX "LoginHistory_createdAt_idx" ON "LoginHistory"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "Merchant_registrationNumber_key" ON "Merchant"("registrationNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Merchant_email_key" ON "Merchant"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Merchant_phone_key" ON "Merchant"("phone");

-- CreateIndex
CREATE INDEX "Merchant_email_idx" ON "Merchant"("email");

-- CreateIndex
CREATE INDEX "Merchant_phone_idx" ON "Merchant"("phone");

-- CreateIndex
CREATE INDEX "Merchant_registrationNumber_idx" ON "Merchant"("registrationNumber");

-- CreateIndex
CREATE INDEX "Merchant_status_idx" ON "Merchant"("status");

-- CreateIndex
CREATE INDEX "Merchant_deletedAt_idx" ON "Merchant"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantSettings_merchantId_key" ON "MerchantSettings"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantBranding_merchantId_key" ON "MerchantBranding"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantSubscription_merchantId_key" ON "MerchantSubscription"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantSubscription_merchantId_idx" ON "MerchantSubscription"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantFeature_merchantId_idx" ON "MerchantFeature"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantFeature_merchantId_featureName_key" ON "MerchantFeature"("merchantId", "featureName");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantLimits_merchantId_key" ON "MerchantLimits"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantFee_merchantId_idx" ON "MerchantFee"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantFee_isActive_idx" ON "MerchantFee"("isActive");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantCompliance_merchantId_key" ON "MerchantCompliance"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantDocument_merchantId_idx" ON "MerchantDocument"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantContact_merchantId_idx" ON "MerchantContact"("merchantId");

-- CreateIndex
CREATE INDEX "MerchantAddress_merchantId_idx" ON "MerchantAddress"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantBusinessHours_merchantId_dayOfWeek_key" ON "MerchantBusinessHours"("merchantId", "dayOfWeek");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantNotificationSettings_merchantId_key" ON "MerchantNotificationSettings"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantSecuritySettings_merchantId_key" ON "MerchantSecuritySettings"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchantWebhookSettings_merchantId_key" ON "MerchantWebhookSettings"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "Terminal_serialNumber_key" ON "Terminal"("serialNumber");

-- CreateIndex
CREATE INDEX "Terminal_merchantId_idx" ON "Terminal"("merchantId");

-- CreateIndex
CREATE INDEX "Terminal_serialNumber_idx" ON "Terminal"("serialNumber");

-- CreateIndex
CREATE INDEX "Terminal_status_idx" ON "Terminal"("status");

-- CreateIndex
CREATE INDEX "Terminal_terminalGroupId_idx" ON "Terminal"("terminalGroupId");

-- CreateIndex
CREATE INDEX "Terminal_deletedAt_idx" ON "Terminal"("deletedAt");

-- CreateIndex
CREATE INDEX "TerminalGroup_merchantId_idx" ON "TerminalGroup"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "TerminalGroup_merchantId_name_key" ON "TerminalGroup"("merchantId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "TerminalConfiguration_terminalId_key" ON "TerminalConfiguration"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "TerminalKey_keyHash_key" ON "TerminalKey"("keyHash");

-- CreateIndex
CREATE INDEX "TerminalKey_terminalId_idx" ON "TerminalKey"("terminalId");

-- CreateIndex
CREATE INDEX "TerminalKey_keyHash_idx" ON "TerminalKey"("keyHash");

-- CreateIndex
CREATE INDEX "TerminalHeartbeat_terminalId_idx" ON "TerminalHeartbeat"("terminalId");

-- CreateIndex
CREATE INDEX "TerminalHeartbeat_createdAt_idx" ON "TerminalHeartbeat"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "TerminalLog_terminalId_idx" ON "TerminalLog"("terminalId");

-- CreateIndex
CREATE INDEX "TerminalLog_createdAt_idx" ON "TerminalLog"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "TerminalLog_level_idx" ON "TerminalLog"("level");

-- CreateIndex
CREATE INDEX "TerminalSoftware_terminalId_idx" ON "TerminalSoftware"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "TerminalSoftware_terminalId_version_key" ON "TerminalSoftware"("terminalId", "version");

-- CreateIndex
CREATE INDEX "TerminalLocation_terminalId_idx" ON "TerminalLocation"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "Device_terminalId_key" ON "Device"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "Device_serialNumber_key" ON "Device"("serialNumber");

-- CreateIndex
CREATE INDEX "Device_terminalId_idx" ON "Device"("terminalId");

-- CreateIndex
CREATE INDEX "Device_serialNumber_idx" ON "Device"("serialNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Printer_terminalId_key" ON "Printer"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "Scanner_terminalId_key" ON "Scanner"("terminalId");

-- CreateIndex
CREATE UNIQUE INDEX "CashDrawer_terminalId_key" ON "CashDrawer"("terminalId");

-- CreateIndex
CREATE INDEX "ReceiptTemplate_merchantId_idx" ON "ReceiptTemplate"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "ReceiptTemplate_merchantId_name_key" ON "ReceiptTemplate"("merchantId", "name");

-- CreateIndex
CREATE UNIQUE INDEX "Wallet_bankAccountId_key" ON "Wallet"("bankAccountId");

-- CreateIndex
CREATE INDEX "Wallet_merchantId_idx" ON "Wallet"("merchantId");

-- CreateIndex
CREATE INDEX "Wallet_currency_idx" ON "Wallet"("currency");

-- CreateIndex
CREATE INDEX "Wallet_type_idx" ON "Wallet"("type");

-- CreateIndex
CREATE INDEX "Wallet_address_idx" ON "Wallet"("address");

-- CreateIndex
CREATE INDEX "Wallet_blockchainId_idx" ON "Wallet"("blockchainId");

-- CreateIndex
CREATE INDEX "WalletBalance_walletId_idx" ON "WalletBalance"("walletId");

-- CreateIndex
CREATE INDEX "WalletBalance_snapshotAt_idx" ON "WalletBalance"("snapshotAt");

-- CreateIndex
CREATE UNIQUE INDEX "WalletAddress_address_key" ON "WalletAddress"("address");

-- CreateIndex
CREATE INDEX "WalletAddress_walletId_idx" ON "WalletAddress"("walletId");

-- CreateIndex
CREATE INDEX "WalletAddress_blockchainId_idx" ON "WalletAddress"("blockchainId");

-- CreateIndex
CREATE UNIQUE INDEX "WalletKey_keyHash_key" ON "WalletKey"("keyHash");

-- CreateIndex
CREATE INDEX "WalletKey_walletId_idx" ON "WalletKey"("walletId");

-- CreateIndex
CREATE INDEX "WalletKey_keyHash_idx" ON "WalletKey"("keyHash");

-- CreateIndex
CREATE INDEX "WalletAudit_walletId_idx" ON "WalletAudit"("walletId");

-- CreateIndex
CREATE INDEX "WalletAudit_createdAt_idx" ON "WalletAudit"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "BankAccount_merchantId_idx" ON "BankAccount"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "BankAccount_merchantId_accountNumber_key" ON "BankAccount"("merchantId", "accountNumber");

-- CreateIndex
CREATE INDEX "Settlement_merchantId_idx" ON "Settlement"("merchantId");

-- CreateIndex
CREATE INDEX "Settlement_batchId_idx" ON "Settlement"("batchId");

-- CreateIndex
CREATE INDEX "Settlement_walletId_idx" ON "Settlement"("walletId");

-- CreateIndex
CREATE INDEX "Settlement_status_idx" ON "Settlement"("status");

-- CreateIndex
CREATE INDEX "Settlement_createdAt_idx" ON "Settlement"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "SettlementBatch_batchReference_key" ON "SettlementBatch"("batchReference");

-- CreateIndex
CREATE INDEX "SettlementBatch_merchantId_idx" ON "SettlementBatch"("merchantId");

-- CreateIndex
CREATE INDEX "SettlementBatch_batchReference_idx" ON "SettlementBatch"("batchReference");

-- CreateIndex
CREATE INDEX "SettlementBatch_status_idx" ON "SettlementBatch"("status");

-- CreateIndex
CREATE INDEX "SettlementAttempt_settlementId_idx" ON "SettlementAttempt"("settlementId");

-- CreateIndex
CREATE INDEX "SettlementFee_settlementId_idx" ON "SettlementFee"("settlementId");

-- CreateIndex
CREATE INDEX "SettlementSchedule_merchantId_idx" ON "SettlementSchedule"("merchantId");

-- CreateIndex
CREATE INDEX "SettlementRule_merchantId_idx" ON "SettlementRule"("merchantId");

-- CreateIndex
CREATE INDEX "ExchangeRate_fromCurrency_toCurrency_idx" ON "ExchangeRate"("fromCurrency", "toCurrency");

-- CreateIndex
CREATE INDEX "ExchangeRate_timestamp_idx" ON "ExchangeRate"("timestamp" DESC);

-- CreateIndex
CREATE INDEX "ExchangeRateHistory_fromCurrency_toCurrency_timestamp_idx" ON "ExchangeRateHistory"("fromCurrency", "toCurrency", "timestamp" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "BlockchainTransaction_txHash_key" ON "BlockchainTransaction"("txHash");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_txHash_idx" ON "BlockchainTransaction"("txHash");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_walletId_idx" ON "BlockchainTransaction"("walletId");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_blockchainId_idx" ON "BlockchainTransaction"("blockchainId");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_fromAddress_idx" ON "BlockchainTransaction"("fromAddress");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_toAddress_idx" ON "BlockchainTransaction"("toAddress");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_status_idx" ON "BlockchainTransaction"("status");

-- CreateIndex
CREATE INDEX "BlockchainTransaction_createdAt_idx" ON "BlockchainTransaction"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "BlockchainConfirmation_txId_idx" ON "BlockchainConfirmation"("txId");

-- CreateIndex
CREATE INDEX "BlockchainConfirmation_confirmations_idx" ON "BlockchainConfirmation"("confirmations");

-- CreateIndex
CREATE INDEX "BlockchainFee_blockchainId_idx" ON "BlockchainFee"("blockchainId");

-- CreateIndex
CREATE INDEX "BlockchainFee_timestamp_idx" ON "BlockchainFee"("timestamp" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "BlockchainNetwork_name_key" ON "BlockchainNetwork"("name");

-- CreateIndex
CREATE INDEX "GasPrice_networkId_idx" ON "GasPrice"("networkId");

-- CreateIndex
CREATE INDEX "GasPrice_timestamp_idx" ON "GasPrice"("timestamp" DESC);

-- CreateIndex
CREATE INDEX "GasHistory_networkId_idx" ON "GasHistory"("networkId");

-- CreateIndex
CREATE INDEX "GasHistory_timestamp_idx" ON "GasHistory"("timestamp" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "Transaction_reference_key" ON "Transaction"("reference");

-- CreateIndex
CREATE UNIQUE INDEX "Transaction_idempotencyKey_key" ON "Transaction"("idempotencyKey");

-- CreateIndex
CREATE UNIQUE INDEX "Transaction_blockchainTransactionId_key" ON "Transaction"("blockchainTransactionId");

-- CreateIndex
CREATE INDEX "Transaction_merchantId_idx" ON "Transaction"("merchantId");

-- CreateIndex
CREATE INDEX "Transaction_terminalId_idx" ON "Transaction"("terminalId");

-- CreateIndex
CREATE INDEX "Transaction_customerId_idx" ON "Transaction"("customerId");

-- CreateIndex
CREATE INDEX "Transaction_walletId_idx" ON "Transaction"("walletId");

-- CreateIndex
CREATE INDEX "Transaction_status_idx" ON "Transaction"("status");

-- CreateIndex
CREATE INDEX "Transaction_reference_idx" ON "Transaction"("reference");

-- CreateIndex
CREATE INDEX "Transaction_gatewayTransactionId_idx" ON "Transaction"("gatewayTransactionId");

-- CreateIndex
CREATE INDEX "Transaction_createdAt_idx" ON "Transaction"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "Transaction_settlementStatus_idx" ON "Transaction"("settlementStatus");

-- CreateIndex
CREATE INDEX "Transaction_paymentMethod_idx" ON "Transaction"("paymentMethod");

-- CreateIndex
CREATE INDEX "Transaction_cryptoConversionId_idx" ON "Transaction"("cryptoConversionId");

-- CreateIndex
CREATE INDEX "Transaction_paymentIntentId_idx" ON "Transaction"("paymentIntentId");

-- CreateIndex
CREATE INDEX "TransactionItem_transactionId_idx" ON "TransactionItem"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionItem_productId_idx" ON "TransactionItem"("productId");

-- CreateIndex
CREATE INDEX "TransactionFee_transactionId_idx" ON "TransactionFee"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionFee_walletId_idx" ON "TransactionFee"("walletId");

-- CreateIndex
CREATE INDEX "TransactionTax_transactionId_idx" ON "TransactionTax"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionDiscount_transactionId_idx" ON "TransactionDiscount"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionMetadata_transactionId_idx" ON "TransactionMetadata"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "TransactionMetadata_transactionId_key_key" ON "TransactionMetadata"("transactionId", "key");

-- CreateIndex
CREATE INDEX "TransactionEvent_transactionId_idx" ON "TransactionEvent"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionEvent_createdAt_idx" ON "TransactionEvent"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "TransactionTimeline_transactionId_idx" ON "TransactionTimeline"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionTimeline_createdAt_idx" ON "TransactionTimeline"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "TransactionStatusHistory_transactionId_idx" ON "TransactionStatusHistory"("transactionId");

-- CreateIndex
CREATE INDEX "TransactionStatusHistory_createdAt_idx" ON "TransactionStatusHistory"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "Refund_refundReference_key" ON "Refund"("refundReference");

-- CreateIndex
CREATE INDEX "Refund_transactionId_idx" ON "Refund"("transactionId");

-- CreateIndex
CREATE INDEX "Refund_merchantId_idx" ON "Refund"("merchantId");

-- CreateIndex
CREATE INDEX "Refund_status_idx" ON "Refund"("status");

-- CreateIndex
CREATE INDEX "Refund_refundReference_idx" ON "Refund"("refundReference");

-- CreateIndex
CREATE UNIQUE INDEX "RefundReason_reason_key" ON "RefundReason"("reason");

-- CreateIndex
CREATE INDEX "RefundReason_merchantId_idx" ON "RefundReason"("merchantId");

-- CreateIndex
CREATE INDEX "Chargeback_transactionId_idx" ON "Chargeback"("transactionId");

-- CreateIndex
CREATE INDEX "Chargeback_merchantId_idx" ON "Chargeback"("merchantId");

-- CreateIndex
CREATE INDEX "Chargeback_status_idx" ON "Chargeback"("status");

-- CreateIndex
CREATE INDEX "ChargebackEvidence_chargebackId_idx" ON "ChargebackEvidence"("chargebackId");

-- CreateIndex
CREATE UNIQUE INDEX "Dispute_chargebackId_key" ON "Dispute"("chargebackId");

-- CreateIndex
CREATE INDEX "Dispute_transactionId_idx" ON "Dispute"("transactionId");

-- CreateIndex
CREATE INDEX "Dispute_merchantId_idx" ON "Dispute"("merchantId");

-- CreateIndex
CREATE INDEX "Dispute_status_idx" ON "Dispute"("status");

-- CreateIndex
CREATE INDEX "Dispute_chargebackId_idx" ON "Dispute"("chargebackId");

-- CreateIndex
CREATE INDEX "DisputeEvidence_disputeId_idx" ON "DisputeEvidence"("disputeId");

-- CreateIndex
CREATE UNIQUE INDEX "Authorization_transactionId_key" ON "Authorization"("transactionId");

-- CreateIndex
CREATE INDEX "Authorization_transactionId_idx" ON "Authorization"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Capture_transactionId_key" ON "Capture"("transactionId");

-- CreateIndex
CREATE INDEX "Capture_transactionId_idx" ON "Capture"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Reversal_transactionId_key" ON "Reversal"("transactionId");

-- CreateIndex
CREATE INDEX "Reversal_transactionId_idx" ON "Reversal"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "VoidTransaction_transactionId_key" ON "VoidTransaction"("transactionId");

-- CreateIndex
CREATE INDEX "VoidTransaction_transactionId_idx" ON "VoidTransaction"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "CardPayment_transactionId_key" ON "CardPayment"("transactionId");

-- CreateIndex
CREATE INDEX "CardPayment_transactionId_idx" ON "CardPayment"("transactionId");

-- CreateIndex
CREATE INDEX "CardPayment_cardTokenId_idx" ON "CardPayment"("cardTokenId");

-- CreateIndex
CREATE INDEX "CardPayment_bin_idx" ON "CardPayment"("bin");

-- CreateIndex
CREATE UNIQUE INDEX "CardToken_token_key" ON "CardToken"("token");

-- CreateIndex
CREATE INDEX "CardToken_merchantId_idx" ON "CardToken"("merchantId");

-- CreateIndex
CREATE INDEX "CardToken_customerId_idx" ON "CardToken"("customerId");

-- CreateIndex
CREATE INDEX "CardToken_token_idx" ON "CardToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "CardBIN_bin_key" ON "CardBIN"("bin");

-- CreateIndex
CREATE INDEX "CardBIN_bin_idx" ON "CardBIN"("bin");

-- CreateIndex
CREATE INDEX "PaymentMethod_merchantId_idx" ON "PaymentMethod"("merchantId");

-- CreateIndex
CREATE INDEX "PaymentMethod_customerId_idx" ON "PaymentMethod"("customerId");

-- CreateIndex
CREATE INDEX "PaymentMethod_type_idx" ON "PaymentMethod"("type");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentIntent_clientSecret_key" ON "PaymentIntent"("clientSecret");

-- CreateIndex
CREATE INDEX "PaymentIntent_merchantId_idx" ON "PaymentIntent"("merchantId");

-- CreateIndex
CREATE INDEX "PaymentIntent_customerId_idx" ON "PaymentIntent"("customerId");

-- CreateIndex
CREATE INDEX "PaymentIntent_status_idx" ON "PaymentIntent"("status");

-- CreateIndex
CREATE INDEX "PaymentIntent_clientSecret_idx" ON "PaymentIntent"("clientSecret");

-- CreateIndex
CREATE INDEX "PaymentAttempt_paymentIntentId_idx" ON "PaymentAttempt"("paymentIntentId");

-- CreateIndex
CREATE INDEX "PaymentAttempt_transactionId_idx" ON "PaymentAttempt"("transactionId");

-- CreateIndex
CREATE INDEX "PaymentAttempt_status_idx" ON "PaymentAttempt"("status");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentProvider_name_key" ON "PaymentProvider"("name");

-- CreateIndex
CREATE INDEX "PaymentProvider_isActive_idx" ON "PaymentProvider"("isActive");

-- CreateIndex
CREATE INDEX "PaymentProvider_priority_idx" ON "PaymentProvider"("priority");

-- CreateIndex
CREATE INDEX "ProviderResponse_providerId_idx" ON "ProviderResponse"("providerId");

-- CreateIndex
CREATE INDEX "ProviderResponse_requestId_idx" ON "ProviderResponse"("requestId");

-- CreateIndex
CREATE INDEX "ProviderResponse_createdAt_idx" ON "ProviderResponse"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "GatewayLog_merchantId_idx" ON "GatewayLog"("merchantId");

-- CreateIndex
CREATE INDEX "GatewayLog_provider_idx" ON "GatewayLog"("provider");

-- CreateIndex
CREATE INDEX "GatewayLog_createdAt_idx" ON "GatewayLog"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "GatewayRequest_transactionId_key" ON "GatewayRequest"("transactionId");

-- CreateIndex
CREATE INDEX "GatewayRequest_transactionId_idx" ON "GatewayRequest"("transactionId");

-- CreateIndex
CREATE INDEX "GatewayRequest_providerId_idx" ON "GatewayRequest"("providerId");

-- CreateIndex
CREATE INDEX "GatewayRequest_createdAt_idx" ON "GatewayRequest"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "GatewayResponse_gatewayRequestId_key" ON "GatewayResponse"("gatewayRequestId");

-- CreateIndex
CREATE INDEX "GatewayResponse_gatewayRequestId_idx" ON "GatewayResponse"("gatewayRequestId");

-- CreateIndex
CREATE INDEX "Webhook_merchantId_idx" ON "Webhook"("merchantId");

-- CreateIndex
CREATE INDEX "Webhook_isActive_idx" ON "Webhook"("isActive");

-- CreateIndex
CREATE INDEX "WebhookDelivery_webhookId_idx" ON "WebhookDelivery"("webhookId");

-- CreateIndex
CREATE INDEX "WebhookDelivery_transactionId_idx" ON "WebhookDelivery"("transactionId");

-- CreateIndex
CREATE INDEX "WebhookDelivery_status_idx" ON "WebhookDelivery"("status");

-- CreateIndex
CREATE INDEX "WebhookDelivery_createdAt_idx" ON "WebhookDelivery"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "WebhookEvent_merchantId_idx" ON "WebhookEvent"("merchantId");

-- CreateIndex
CREATE INDEX "WebhookEvent_eventName_idx" ON "WebhookEvent"("eventName");

-- CreateIndex
CREATE INDEX "WebhookEvent_createdAt_idx" ON "WebhookEvent"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "WebhookRetry_webhookDeliveryId_idx" ON "WebhookRetry"("webhookDeliveryId");

-- CreateIndex
CREATE INDEX "WebhookRetry_scheduledAt_idx" ON "WebhookRetry"("scheduledAt");

-- CreateIndex
CREATE UNIQUE INDEX "CryptoAsset_symbol_key" ON "CryptoAsset"("symbol");

-- CreateIndex
CREATE INDEX "CryptoAsset_symbol_idx" ON "CryptoAsset"("symbol");

-- CreateIndex
CREATE INDEX "CryptoAsset_blockchainId_idx" ON "CryptoAsset"("blockchainId");

-- CreateIndex
CREATE INDEX "CryptoConversion_merchantId_idx" ON "CryptoConversion"("merchantId");

-- CreateIndex
CREATE INDEX "CryptoConversion_transactionId_idx" ON "CryptoConversion"("transactionId");

-- CreateIndex
CREATE INDEX "CryptoConversion_walletTransferId_idx" ON "CryptoConversion"("walletTransferId");

-- CreateIndex
CREATE INDEX "CryptoConversion_status_idx" ON "CryptoConversion"("status");

-- CreateIndex
CREATE INDEX "CryptoQuote_fromCurrency_toCurrency_idx" ON "CryptoQuote"("fromCurrency", "toCurrency");

-- CreateIndex
CREATE INDEX "CryptoQuote_expiresAt_idx" ON "CryptoQuote"("expiresAt");

-- CreateIndex
CREATE INDEX "CryptoRate_baseCurrency_quoteCurrency_idx" ON "CryptoRate"("baseCurrency", "quoteCurrency");

-- CreateIndex
CREATE INDEX "CryptoRate_timestamp_idx" ON "CryptoRate"("timestamp" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "CryptoRate_baseCurrency_quoteCurrency_source_timestamp_key" ON "CryptoRate"("baseCurrency", "quoteCurrency", "source", "timestamp");

-- CreateIndex
CREATE UNIQUE INDEX "WalletTransfer_reference_key" ON "WalletTransfer"("reference");

-- CreateIndex
CREATE UNIQUE INDEX "WalletTransfer_blockchainTxId_key" ON "WalletTransfer"("blockchainTxId");

-- CreateIndex
CREATE UNIQUE INDEX "WalletTransfer_refundId_key" ON "WalletTransfer"("refundId");

-- CreateIndex
CREATE INDEX "WalletTransfer_merchantId_idx" ON "WalletTransfer"("merchantId");

-- CreateIndex
CREATE INDEX "WalletTransfer_fromWalletId_idx" ON "WalletTransfer"("fromWalletId");

-- CreateIndex
CREATE INDEX "WalletTransfer_toWalletId_idx" ON "WalletTransfer"("toWalletId");

-- CreateIndex
CREATE INDEX "WalletTransfer_reference_idx" ON "WalletTransfer"("reference");

-- CreateIndex
CREATE INDEX "WalletTransfer_status_idx" ON "WalletTransfer"("status");

-- CreateIndex
CREATE INDEX "WalletTransfer_blockchainTxId_idx" ON "WalletTransfer"("blockchainTxId");

-- CreateIndex
CREATE INDEX "WalletTransfer_cryptoConversionId_idx" ON "WalletTransfer"("cryptoConversionId");

-- CreateIndex
CREATE INDEX "WalletTransfer_refundId_idx" ON "WalletTransfer"("refundId");

-- CreateIndex
CREATE UNIQUE INDEX "ColdWalletTransfer_walletTransferId_key" ON "ColdWalletTransfer"("walletTransferId");

-- CreateIndex
CREATE INDEX "ColdWalletTransfer_walletTransferId_idx" ON "ColdWalletTransfer"("walletTransferId");

-- CreateIndex
CREATE INDEX "ColdWalletTransfer_coldWalletAddress_idx" ON "ColdWalletTransfer"("coldWalletAddress");

-- CreateIndex
CREATE UNIQUE INDEX "HotWalletTransfer_walletTransferId_key" ON "HotWalletTransfer"("walletTransferId");

-- CreateIndex
CREATE INDEX "HotWalletTransfer_walletTransferId_idx" ON "HotWalletTransfer"("walletTransferId");

-- CreateIndex
CREATE INDEX "HotWalletTransfer_hotWalletAddress_idx" ON "HotWalletTransfer"("hotWalletAddress");

-- CreateIndex
CREATE INDEX "LiquidityPool_merchantId_idx" ON "LiquidityPool"("merchantId");

-- CreateIndex
CREATE INDEX "LiquidityPool_assetCurrency_idx" ON "LiquidityPool"("assetCurrency");

-- CreateIndex
CREATE UNIQUE INDEX "ExchangeProvider_name_key" ON "ExchangeProvider"("name");

-- CreateIndex
CREATE INDEX "ExchangeProvider_name_idx" ON "ExchangeProvider"("name");

-- CreateIndex
CREATE INDEX "ExchangeOrder_exchangeProviderId_idx" ON "ExchangeOrder"("exchangeProviderId");

-- CreateIndex
CREATE INDEX "ExchangeOrder_merchantId_idx" ON "ExchangeOrder"("merchantId");

-- CreateIndex
CREATE INDEX "ExchangeOrder_orderId_idx" ON "ExchangeOrder"("orderId");

-- CreateIndex
CREATE INDEX "ExchangeOrder_status_idx" ON "ExchangeOrder"("status");

-- CreateIndex
CREATE INDEX "ExchangeTrade_orderId_idx" ON "ExchangeTrade"("orderId");

-- CreateIndex
CREATE INDEX "ExchangeTrade_tradeId_idx" ON "ExchangeTrade"("tradeId");

-- CreateIndex
CREATE INDEX "ExchangeQuote_exchangeProviderId_idx" ON "ExchangeQuote"("exchangeProviderId");

-- CreateIndex
CREATE INDEX "ExchangeQuote_fromCurrency_toCurrency_idx" ON "ExchangeQuote"("fromCurrency", "toCurrency");

-- CreateIndex
CREATE INDEX "ExchangeQuote_expiresAt_idx" ON "ExchangeQuote"("expiresAt");

-- CreateIndex
CREATE UNIQUE INDEX "BlockchainExplorer_blockchainId_key" ON "BlockchainExplorer"("blockchainId");

-- CreateIndex
CREATE UNIQUE INDEX "Kyc_merchantId_key" ON "Kyc"("merchantId");

-- CreateIndex
CREATE INDEX "Kyc_merchantId_idx" ON "Kyc"("merchantId");

-- CreateIndex
CREATE INDEX "Kyc_status_idx" ON "Kyc"("status");

-- CreateIndex
CREATE INDEX "KycDocument_kycId_idx" ON "KycDocument"("kycId");

-- CreateIndex
CREATE INDEX "KycReview_kycId_idx" ON "KycReview"("kycId");

-- CreateIndex
CREATE INDEX "IdentityVerification_kycId_idx" ON "IdentityVerification"("kycId");

-- CreateIndex
CREATE INDEX "AddressVerification_kycId_idx" ON "AddressVerification"("kycId");

-- CreateIndex
CREATE INDEX "SanctionCheck_kycId_idx" ON "SanctionCheck"("kycId");

-- CreateIndex
CREATE INDEX "PEPCheck_kycId_idx" ON "PEPCheck"("kycId");

-- CreateIndex
CREATE INDEX "RiskAssessment_kycId_idx" ON "RiskAssessment"("kycId");

-- CreateIndex
CREATE INDEX "AMLCheck_kycId_idx" ON "AMLCheck"("kycId");

-- CreateIndex
CREATE INDEX "ComplianceLog_merchantId_idx" ON "ComplianceLog"("merchantId");

-- CreateIndex
CREATE INDEX "ComplianceLog_createdAt_idx" ON "ComplianceLog"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "ComplianceReview_merchantId_idx" ON "ComplianceReview"("merchantId");

-- CreateIndex
CREATE INDEX "ComplianceReview_status_idx" ON "ComplianceReview"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Product_sku_key" ON "Product"("sku");

-- CreateIndex
CREATE INDEX "Product_merchantId_idx" ON "Product"("merchantId");

-- CreateIndex
CREATE INDEX "Product_sku_idx" ON "Product"("sku");

-- CreateIndex
CREATE INDEX "Product_barcode_idx" ON "Product"("barcode");

-- CreateIndex
CREATE INDEX "Product_categoryId_idx" ON "Product"("categoryId");

-- CreateIndex
CREATE INDEX "Product_brandId_idx" ON "Product"("brandId");

-- CreateIndex
CREATE INDEX "Product_deletedAt_idx" ON "Product"("deletedAt");

-- CreateIndex
CREATE INDEX "Category_merchantId_idx" ON "Category"("merchantId");

-- CreateIndex
CREATE INDEX "Category_parentId_idx" ON "Category"("parentId");

-- CreateIndex
CREATE UNIQUE INDEX "Category_merchantId_name_key" ON "Category"("merchantId", "name");

-- CreateIndex
CREATE INDEX "Brand_merchantId_idx" ON "Brand"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "Brand_merchantId_name_key" ON "Brand"("merchantId", "name");

-- CreateIndex
CREATE INDEX "Inventory_merchantId_idx" ON "Inventory"("merchantId");

-- CreateIndex
CREATE INDEX "Inventory_productId_idx" ON "Inventory"("productId");

-- CreateIndex
CREATE INDEX "Inventory_location_idx" ON "Inventory"("location");

-- CreateIndex
CREATE UNIQUE INDEX "Inventory_merchantId_productId_location_key" ON "Inventory"("merchantId", "productId", "location");

-- CreateIndex
CREATE INDEX "InventoryMovement_inventoryId_idx" ON "InventoryMovement"("inventoryId");

-- CreateIndex
CREATE INDEX "InventoryMovement_productId_idx" ON "InventoryMovement"("productId");

-- CreateIndex
CREATE INDEX "InventoryMovement_createdAt_idx" ON "InventoryMovement"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "InventoryAdjustment_inventoryId_idx" ON "InventoryAdjustment"("inventoryId");

-- CreateIndex
CREATE INDEX "InventoryAdjustment_productId_idx" ON "InventoryAdjustment"("productId");

-- CreateIndex
CREATE INDEX "Supplier_merchantId_idx" ON "Supplier"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "Purchase_reference_key" ON "Purchase"("reference");

-- CreateIndex
CREATE INDEX "Purchase_merchantId_idx" ON "Purchase"("merchantId");

-- CreateIndex
CREATE INDEX "Purchase_supplierId_idx" ON "Purchase"("supplierId");

-- CreateIndex
CREATE INDEX "Purchase_reference_idx" ON "Purchase"("reference");

-- CreateIndex
CREATE INDEX "PurchaseItem_purchaseId_idx" ON "PurchaseItem"("purchaseId");

-- CreateIndex
CREATE INDEX "PurchaseItem_productId_idx" ON "PurchaseItem"("productId");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_email_key" ON "Customer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_phone_key" ON "Customer"("phone");

-- CreateIndex
CREATE INDEX "Customer_merchantId_idx" ON "Customer"("merchantId");

-- CreateIndex
CREATE INDEX "Customer_email_idx" ON "Customer"("email");

-- CreateIndex
CREATE INDEX "Customer_phone_idx" ON "Customer"("phone");

-- CreateIndex
CREATE INDEX "Customer_status_idx" ON "Customer"("status");

-- CreateIndex
CREATE INDEX "Customer_deletedAt_idx" ON "Customer"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerWallet_address_key" ON "CustomerWallet"("address");

-- CreateIndex
CREATE INDEX "CustomerWallet_customerId_idx" ON "CustomerWallet"("customerId");

-- CreateIndex
CREATE INDEX "CustomerWallet_address_idx" ON "CustomerWallet"("address");

-- CreateIndex
CREATE INDEX "CustomerAddress_customerId_idx" ON "CustomerAddress"("customerId");

-- CreateIndex
CREATE INDEX "CustomerDevice_customerId_idx" ON "CustomerDevice"("customerId");

-- CreateIndex
CREATE INDEX "CustomerDevice_deviceId_idx" ON "CustomerDevice"("deviceId");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerCard_token_key" ON "CustomerCard"("token");

-- CreateIndex
CREATE INDEX "CustomerCard_customerId_idx" ON "CustomerCard"("customerId");

-- CreateIndex
CREATE INDEX "CustomerCard_token_idx" ON "CustomerCard"("token");

-- CreateIndex
CREATE INDEX "CustomerReward_customerId_idx" ON "CustomerReward"("customerId");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerLoyalty_customerId_key" ON "CustomerLoyalty"("customerId");

-- CreateIndex
CREATE INDEX "CustomerActivity_customerId_idx" ON "CustomerActivity"("customerId");

-- CreateIndex
CREATE INDEX "CustomerActivity_createdAt_idx" ON "CustomerActivity"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "CustomerNotification_customerId_idx" ON "CustomerNotification"("customerId");

-- CreateIndex
CREATE INDEX "CustomerNotification_createdAt_idx" ON "CustomerNotification"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "Employee_userId_key" ON "Employee"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Employee_email_key" ON "Employee"("email");

-- CreateIndex
CREATE INDEX "Employee_merchantId_idx" ON "Employee"("merchantId");

-- CreateIndex
CREATE INDEX "Employee_email_idx" ON "Employee"("email");

-- CreateIndex
CREATE INDEX "Employee_userId_idx" ON "Employee"("userId");

-- CreateIndex
CREATE INDEX "Employee_departmentId_idx" ON "Employee"("departmentId");

-- CreateIndex
CREATE INDEX "Employee_isActive_idx" ON "Employee"("isActive");

-- CreateIndex
CREATE INDEX "Department_merchantId_idx" ON "Department"("merchantId");

-- CreateIndex
CREATE UNIQUE INDEX "Department_merchantId_name_key" ON "Department"("merchantId", "name");

-- CreateIndex
CREATE INDEX "Attendance_employeeId_idx" ON "Attendance"("employeeId");

-- CreateIndex
CREATE INDEX "Attendance_date_idx" ON "Attendance"("date");

-- CreateIndex
CREATE INDEX "Shift_employeeId_idx" ON "Shift"("employeeId");

-- CreateIndex
CREATE INDEX "Shift_startTime_idx" ON "Shift"("startTime");

-- CreateIndex
CREATE INDEX "ClockIn_employeeId_idx" ON "ClockIn"("employeeId");

-- CreateIndex
CREATE INDEX "ClockIn_clockInTime_idx" ON "ClockIn"("clockInTime");

-- CreateIndex
CREATE INDEX "ClockOut_employeeId_idx" ON "ClockOut"("employeeId");

-- CreateIndex
CREATE INDEX "ClockOut_clockOutTime_idx" ON "ClockOut"("clockOutTime");

-- CreateIndex
CREATE INDEX "Salary_employeeId_idx" ON "Salary"("employeeId");

-- CreateIndex
CREATE INDEX "Salary_effectiveDate_idx" ON "Salary"("effectiveDate");

-- CreateIndex
CREATE INDEX "Payroll_merchantId_idx" ON "Payroll"("merchantId");

-- CreateIndex
CREATE INDEX "Payroll_employeeId_idx" ON "Payroll"("employeeId");

-- CreateIndex
CREATE INDEX "Payroll_periodStart_idx" ON "Payroll"("periodStart");

-- CreateIndex
CREATE INDEX "Commission_employeeId_idx" ON "Commission"("employeeId");

-- CreateIndex
CREATE INDEX "Commission_transactionId_idx" ON "Commission"("transactionId");

-- CreateIndex
CREATE INDEX "AuditLog_userId_idx" ON "AuditLog"("userId");

-- CreateIndex
CREATE INDEX "AuditLog_merchantId_idx" ON "AuditLog"("merchantId");

-- CreateIndex
CREATE INDEX "AuditLog_transactionId_idx" ON "AuditLog"("transactionId");

-- CreateIndex
CREATE INDEX "AuditLog_action_idx" ON "AuditLog"("action");

-- CreateIndex
CREATE INDEX "AuditLog_createdAt_idx" ON "AuditLog"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "ActivityLog_userId_idx" ON "ActivityLog"("userId");

-- CreateIndex
CREATE INDEX "ActivityLog_merchantId_idx" ON "ActivityLog"("merchantId");

-- CreateIndex
CREATE INDEX "ActivityLog_createdAt_idx" ON "ActivityLog"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "Notification_merchantId_idx" ON "Notification"("merchantId");

-- CreateIndex
CREATE INDEX "Notification_userId_idx" ON "Notification"("userId");

-- CreateIndex
CREATE INDEX "Notification_customerId_idx" ON "Notification"("customerId");

-- CreateIndex
CREATE INDEX "Notification_readAt_idx" ON "Notification"("readAt");

-- CreateIndex
CREATE INDEX "Notification_createdAt_idx" ON "Notification"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "NotificationLog_notificationId_idx" ON "NotificationLog"("notificationId");

-- CreateIndex
CREATE INDEX "Report_merchantId_idx" ON "Report"("merchantId");

-- CreateIndex
CREATE INDEX "Report_type_idx" ON "Report"("type");

-- CreateIndex
CREATE INDEX "Report_generatedAt_idx" ON "Report"("generatedAt" DESC);

-- CreateIndex
CREATE INDEX "ReportExport_reportId_idx" ON "ReportExport"("reportId");

-- CreateIndex
CREATE INDEX "DashboardWidget_merchantId_idx" ON "DashboardWidget"("merchantId");

-- CreateIndex
CREATE INDEX "SystemSetting_merchantId_idx" ON "SystemSetting"("merchantId");

-- CreateIndex
CREATE INDEX "SystemSetting_key_idx" ON "SystemSetting"("key");

-- CreateIndex
CREATE UNIQUE INDEX "SystemSetting_merchantId_key_key" ON "SystemSetting"("merchantId", "key");

-- CreateIndex
CREATE UNIQUE INDEX "SystemConfiguration_key_key" ON "SystemConfiguration"("key");

-- CreateIndex
CREATE INDEX "SystemConfiguration_key_idx" ON "SystemConfiguration"("key");

-- CreateIndex
CREATE INDEX "BackupHistory_backupId_idx" ON "BackupHistory"("backupId");

-- CreateIndex
CREATE INDEX "BackupHistory_createdAt_idx" ON "BackupHistory"("createdAt" DESC);

-- CreateIndex
CREATE UNIQUE INDEX "ProviderMetric_provider_key" ON "ProviderMetric"("provider");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_assignedRoleId_fkey" FOREIGN KEY ("assignedRoleId") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefreshToken" ADD CONSTRAINT "RefreshToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PasswordReset" ADD CONSTRAINT "PasswordReset_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailVerification" ADD CONSTRAINT "EmailVerification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKeyUsage" ADD CONSTRAINT "ApiKeyUsage_apiKeyId_fkey" FOREIGN KEY ("apiKeyId") REFERENCES "ApiKey"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolePermission" ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RolePermission" ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPermission" ADD CONSTRAINT "UserPermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPermission" ADD CONSTRAINT "UserPermission_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OAuthAccount" ADD CONSTRAINT "OAuthAccount_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LoginHistory" ADD CONSTRAINT "LoginHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantSettings" ADD CONSTRAINT "MerchantSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantBranding" ADD CONSTRAINT "MerchantBranding_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantSubscription" ADD CONSTRAINT "MerchantSubscription_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantFeature" ADD CONSTRAINT "MerchantFeature_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantLimits" ADD CONSTRAINT "MerchantLimits_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantFee" ADD CONSTRAINT "MerchantFee_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantCompliance" ADD CONSTRAINT "MerchantCompliance_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantDocument" ADD CONSTRAINT "MerchantDocument_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantContact" ADD CONSTRAINT "MerchantContact_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantAddress" ADD CONSTRAINT "MerchantAddress_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantBusinessHours" ADD CONSTRAINT "MerchantBusinessHours_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantNotificationSettings" ADD CONSTRAINT "MerchantNotificationSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantSecuritySettings" ADD CONSTRAINT "MerchantSecuritySettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchantWebhookSettings" ADD CONSTRAINT "MerchantWebhookSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Terminal" ADD CONSTRAINT "Terminal_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Terminal" ADD CONSTRAINT "Terminal_terminalGroupId_fkey" FOREIGN KEY ("terminalGroupId") REFERENCES "TerminalGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalGroup" ADD CONSTRAINT "TerminalGroup_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalConfiguration" ADD CONSTRAINT "TerminalConfiguration_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalKey" ADD CONSTRAINT "TerminalKey_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalHeartbeat" ADD CONSTRAINT "TerminalHeartbeat_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalLog" ADD CONSTRAINT "TerminalLog_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalSoftware" ADD CONSTRAINT "TerminalSoftware_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TerminalLocation" ADD CONSTRAINT "TerminalLocation_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Device" ADD CONSTRAINT "Device_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Printer" ADD CONSTRAINT "Printer_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Scanner" ADD CONSTRAINT "Scanner_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CashDrawer" ADD CONSTRAINT "CashDrawer_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReceiptTemplate" ADD CONSTRAINT "ReceiptTemplate_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_bankAccountId_fkey" FOREIGN KEY ("bankAccountId") REFERENCES "BankAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wallet" ADD CONSTRAINT "Wallet_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletBalance" ADD CONSTRAINT "WalletBalance_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletAddress" ADD CONSTRAINT "WalletAddress_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletAddress" ADD CONSTRAINT "WalletAddress_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletKey" ADD CONSTRAINT "WalletKey_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletAudit" ADD CONSTRAINT "WalletAudit_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BankAccount" ADD CONSTRAINT "BankAccount_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Settlement" ADD CONSTRAINT "Settlement_bankAccountId_fkey" FOREIGN KEY ("bankAccountId") REFERENCES "BankAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Settlement" ADD CONSTRAINT "Settlement_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "SettlementBatch"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Settlement" ADD CONSTRAINT "Settlement_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Settlement" ADD CONSTRAINT "Settlement_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SettlementBatch" ADD CONSTRAINT "SettlementBatch_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SettlementAttempt" ADD CONSTRAINT "SettlementAttempt_settlementId_fkey" FOREIGN KEY ("settlementId") REFERENCES "Settlement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SettlementFee" ADD CONSTRAINT "SettlementFee_settlementId_fkey" FOREIGN KEY ("settlementId") REFERENCES "Settlement"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SettlementSchedule" ADD CONSTRAINT "SettlementSchedule_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SettlementRule" ADD CONSTRAINT "SettlementRule_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlockchainTransaction" ADD CONSTRAINT "BlockchainTransaction_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlockchainTransaction" ADD CONSTRAINT "BlockchainTransaction_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlockchainConfirmation" ADD CONSTRAINT "BlockchainConfirmation_txId_fkey" FOREIGN KEY ("txId") REFERENCES "BlockchainTransaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlockchainFee" ADD CONSTRAINT "BlockchainFee_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GasPrice" ADD CONSTRAINT "GasPrice_networkId_fkey" FOREIGN KEY ("networkId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GasHistory" ADD CONSTRAINT "GasHistory_networkId_fkey" FOREIGN KEY ("networkId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_blockchainTransactionId_fkey" FOREIGN KEY ("blockchainTransactionId") REFERENCES "BlockchainTransaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_cryptoConversionId_fkey" FOREIGN KEY ("cryptoConversionId") REFERENCES "CryptoConversion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_paymentIntentId_fkey" FOREIGN KEY ("paymentIntentId") REFERENCES "PaymentIntent"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES "Terminal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionItem" ADD CONSTRAINT "TransactionItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionItem" ADD CONSTRAINT "TransactionItem_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionFee" ADD CONSTRAINT "TransactionFee_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionFee" ADD CONSTRAINT "TransactionFee_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES "Wallet"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionTax" ADD CONSTRAINT "TransactionTax_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionDiscount" ADD CONSTRAINT "TransactionDiscount_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionMetadata" ADD CONSTRAINT "TransactionMetadata_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionEvent" ADD CONSTRAINT "TransactionEvent_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionTimeline" ADD CONSTRAINT "TransactionTimeline_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionStatusHistory" ADD CONSTRAINT "TransactionStatusHistory_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_refundReasonId_fkey" FOREIGN KEY ("refundReasonId") REFERENCES "RefundReason"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Refund" ADD CONSTRAINT "Refund_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefundReason" ADD CONSTRAINT "RefundReason_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chargeback" ADD CONSTRAINT "Chargeback_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chargeback" ADD CONSTRAINT "Chargeback_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChargebackEvidence" ADD CONSTRAINT "ChargebackEvidence_chargebackId_fkey" FOREIGN KEY ("chargebackId") REFERENCES "Chargeback"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dispute" ADD CONSTRAINT "Dispute_chargebackId_fkey" FOREIGN KEY ("chargebackId") REFERENCES "Chargeback"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dispute" ADD CONSTRAINT "Dispute_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dispute" ADD CONSTRAINT "Dispute_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DisputeEvidence" ADD CONSTRAINT "DisputeEvidence_disputeId_fkey" FOREIGN KEY ("disputeId") REFERENCES "Dispute"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Authorization" ADD CONSTRAINT "Authorization_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Capture" ADD CONSTRAINT "Capture_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reversal" ADD CONSTRAINT "Reversal_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VoidTransaction" ADD CONSTRAINT "VoidTransaction_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardPayment" ADD CONSTRAINT "CardPayment_cardTokenId_fkey" FOREIGN KEY ("cardTokenId") REFERENCES "CardToken"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardPayment" ADD CONSTRAINT "CardPayment_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardToken" ADD CONSTRAINT "CardToken_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CardToken" ADD CONSTRAINT "CardToken_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentMethod" ADD CONSTRAINT "PaymentMethod_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentMethod" ADD CONSTRAINT "PaymentMethod_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentIntent" ADD CONSTRAINT "PaymentIntent_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentIntent" ADD CONSTRAINT "PaymentIntent_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentIntent" ADD CONSTRAINT "PaymentIntent_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES "PaymentMethod"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentAttempt" ADD CONSTRAINT "PaymentAttempt_paymentIntentId_fkey" FOREIGN KEY ("paymentIntentId") REFERENCES "PaymentIntent"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentAttempt" ADD CONSTRAINT "PaymentAttempt_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProviderResponse" ADD CONSTRAINT "ProviderResponse_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "PaymentProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GatewayLog" ADD CONSTRAINT "GatewayLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GatewayRequest" ADD CONSTRAINT "GatewayRequest_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES "PaymentProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GatewayRequest" ADD CONSTRAINT "GatewayRequest_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GatewayResponse" ADD CONSTRAINT "GatewayResponse_gatewayRequestId_fkey" FOREIGN KEY ("gatewayRequestId") REFERENCES "GatewayRequest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Webhook" ADD CONSTRAINT "Webhook_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookDelivery" ADD CONSTRAINT "WebhookDelivery_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookDelivery" ADD CONSTRAINT "WebhookDelivery_webhookId_fkey" FOREIGN KEY ("webhookId") REFERENCES "Webhook"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookEvent" ADD CONSTRAINT "WebhookEvent_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WebhookRetry" ADD CONSTRAINT "WebhookRetry_webhookDeliveryId_fkey" FOREIGN KEY ("webhookDeliveryId") REFERENCES "WebhookDelivery"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CryptoAsset" ADD CONSTRAINT "CryptoAsset_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CryptoConversion" ADD CONSTRAINT "CryptoConversion_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CryptoConversion" ADD CONSTRAINT "CryptoConversion_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CryptoConversion" ADD CONSTRAINT "CryptoConversion_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES "WalletTransfer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_blockchainTxId_fkey" FOREIGN KEY ("blockchainTxId") REFERENCES "BlockchainTransaction"("txHash") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_cryptoConversionId_fkey" FOREIGN KEY ("cryptoConversionId") REFERENCES "CryptoConversion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_fromWalletId_fkey" FOREIGN KEY ("fromWalletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_refundId_fkey" FOREIGN KEY ("refundId") REFERENCES "Refund"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WalletTransfer" ADD CONSTRAINT "WalletTransfer_toWalletId_fkey" FOREIGN KEY ("toWalletId") REFERENCES "Wallet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ColdWalletTransfer" ADD CONSTRAINT "ColdWalletTransfer_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES "WalletTransfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HotWalletTransfer" ADD CONSTRAINT "HotWalletTransfer_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES "WalletTransfer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LiquidityPool" ADD CONSTRAINT "LiquidityPool_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeOrder" ADD CONSTRAINT "ExchangeOrder_exchangeProviderId_fkey" FOREIGN KEY ("exchangeProviderId") REFERENCES "ExchangeProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeOrder" ADD CONSTRAINT "ExchangeOrder_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeTrade" ADD CONSTRAINT "ExchangeTrade_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES "ExchangeOrder"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ExchangeQuote" ADD CONSTRAINT "ExchangeQuote_exchangeProviderId_fkey" FOREIGN KEY ("exchangeProviderId") REFERENCES "ExchangeProvider"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BlockchainExplorer" ADD CONSTRAINT "BlockchainExplorer_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Kyc" ADD CONSTRAINT "Kyc_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KycDocument" ADD CONSTRAINT "KycDocument_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KycReview" ADD CONSTRAINT "KycReview_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IdentityVerification" ADD CONSTRAINT "IdentityVerification_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AddressVerification" ADD CONSTRAINT "AddressVerification_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SanctionCheck" ADD CONSTRAINT "SanctionCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PEPCheck" ADD CONSTRAINT "PEPCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RiskAssessment" ADD CONSTRAINT "RiskAssessment_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AMLCheck" ADD CONSTRAINT "AMLCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES "Kyc"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplianceLog" ADD CONSTRAINT "ComplianceLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ComplianceReview" ADD CONSTRAINT "ComplianceReview_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Brand" ADD CONSTRAINT "Brand_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Inventory" ADD CONSTRAINT "Inventory_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryMovement" ADD CONSTRAINT "InventoryMovement_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES "Inventory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryMovement" ADD CONSTRAINT "InventoryMovement_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryAdjustment" ADD CONSTRAINT "InventoryAdjustment_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES "Inventory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryAdjustment" ADD CONSTRAINT "InventoryAdjustment_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Supplier" ADD CONSTRAINT "Supplier_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES "Supplier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseItem" ADD CONSTRAINT "PurchaseItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchaseItem" ADD CONSTRAINT "PurchaseItem_purchaseId_fkey" FOREIGN KEY ("purchaseId") REFERENCES "Purchase"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerWallet" ADD CONSTRAINT "CustomerWallet_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES "BlockchainNetwork"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerWallet" ADD CONSTRAINT "CustomerWallet_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerAddress" ADD CONSTRAINT "CustomerAddress_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerDevice" ADD CONSTRAINT "CustomerDevice_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerCard" ADD CONSTRAINT "CustomerCard_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerReward" ADD CONSTRAINT "CustomerReward_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerLoyalty" ADD CONSTRAINT "CustomerLoyalty_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerActivity" ADD CONSTRAINT "CustomerActivity_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerNotification" ADD CONSTRAINT "CustomerNotification_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES "Department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Department" ADD CONSTRAINT "Department_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attendance" ADD CONSTRAINT "Attendance_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shift" ADD CONSTRAINT "Shift_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClockIn" ADD CONSTRAINT "ClockIn_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClockOut" ADD CONSTRAINT "ClockOut_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Salary" ADD CONSTRAINT "Salary_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payroll" ADD CONSTRAINT "Payroll_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payroll" ADD CONSTRAINT "Payroll_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Commission" ADD CONSTRAINT "Commission_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "Employee"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Commission" ADD CONSTRAINT "Commission_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AuditLog" ADD CONSTRAINT "AuditLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityLog" ADD CONSTRAINT "ActivityLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationLog" ADD CONSTRAINT "NotificationLog_notificationId_fkey" FOREIGN KEY ("notificationId") REFERENCES "Notification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportExport" ADD CONSTRAINT "ReportExport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DashboardWidget" ADD CONSTRAINT "DashboardWidget_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SystemSetting" ADD CONSTRAINT "SystemSetting_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES "Merchant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BackupHistory" ADD CONSTRAINT "BackupHistory_backupId_fkey" FOREIGN KEY ("backupId") REFERENCES "Backup"("id") ON DELETE CASCADE ON UPDATE CASCADE;
