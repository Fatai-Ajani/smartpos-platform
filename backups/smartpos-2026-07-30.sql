--
-- PostgreSQL database dump
--

\restrict zezeK7tXEHH8aavVLwMWJCKYc6LGQu6bIHJyKkTNJjmFRKo1TYMEXYQCX6Q63qY

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: AMLStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AMLStatus" AS ENUM (
    'CLEAR',
    'PENDING',
    'FLAGGED',
    'REVIEW',
    'BLOCKED'
);


ALTER TYPE public."AMLStatus" OWNER TO postgres;

--
-- Name: ApiKeyStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ApiKeyStatus" AS ENUM (
    'ACTIVE',
    'REVOKED',
    'EXPIRED',
    'INACTIVE'
);


ALTER TYPE public."ApiKeyStatus" OWNER TO postgres;

--
-- Name: AttendanceStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."AttendanceStatus" AS ENUM (
    'PRESENT',
    'ABSENT',
    'LATE',
    'LEAVE',
    'HOLIDAY',
    'OVERTIME'
);


ALTER TYPE public."AttendanceStatus" OWNER TO postgres;

--
-- Name: BlockchainNetworkType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."BlockchainNetworkType" AS ENUM (
    'BITCOIN',
    'ETHEREUM',
    'BSC',
    'POLYGON',
    'SOLANA',
    'TRON',
    'AVALANCHE',
    'ARBITRUM',
    'OPTIMISM',
    'BASE',
    'CARDANO',
    'RIPPLE',
    'LITECOIN',
    'DASH',
    'MONERO',
    'ZCASH',
    'TEZOS',
    'ALGORAND',
    'NEAR',
    'COSMOS'
);


ALTER TYPE public."BlockchainNetworkType" OWNER TO postgres;

--
-- Name: CardBrand; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CardBrand" AS ENUM (
    'VISA',
    'MASTERCARD',
    'AMEX',
    'DISCOVER',
    'DINERS',
    'JCB',
    'UNIONPAY',
    'VERVE',
    'RUPAY'
);


ALTER TYPE public."CardBrand" OWNER TO postgres;

--
-- Name: ChargebackStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ChargebackStatus" AS ENUM (
    'INITIATED',
    'UNDER_REVIEW',
    'APPROVED',
    'REJECTED',
    'RESOLVED',
    'ARBITRATION',
    'LOST',
    'WON'
);


ALTER TYPE public."ChargebackStatus" OWNER TO postgres;

--
-- Name: CryptoAssetType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CryptoAssetType" AS ENUM (
    'COIN',
    'TOKEN',
    'STABLECOIN',
    'NFT',
    'WRAPPED'
);


ALTER TYPE public."CryptoAssetType" OWNER TO postgres;

--
-- Name: CurrencyType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CurrencyType" AS ENUM (
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'CAD',
    'AUD',
    'CHF',
    'CNY',
    'KWD',
    'NGN',
    'AED',
    'SAR',
    'BTC',
    'ETH',
    'USDT',
    'USDC',
    'BUSD',
    'DAI',
    'XRP',
    'SOL',
    'ADA',
    'DOT'
);


ALTER TYPE public."CurrencyType" OWNER TO postgres;

--
-- Name: DeviceStatusEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DeviceStatusEnum" AS ENUM (
    'CONNECTED',
    'DISCONNECTED',
    'FAULTY',
    'INACTIVE',
    'UPDATING'
);


ALTER TYPE public."DeviceStatusEnum" OWNER TO postgres;

--
-- Name: DisputeStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DisputeStatus" AS ENUM (
    'OPEN',
    'UNDER_REVIEW',
    'RESPONDED',
    'RESOLVED',
    'CLOSED',
    'ESCALATED',
    'MEDIATION'
);


ALTER TYPE public."DisputeStatus" OWNER TO postgres;

--
-- Name: EmployeeRole; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."EmployeeRole" AS ENUM (
    'MANAGER',
    'SUPERVISOR',
    'CASHIER',
    'ACCOUNTANT',
    'ADMIN',
    'SUPPORT'
);


ALTER TYPE public."EmployeeRole" OWNER TO postgres;

--
-- Name: FeatureFlag; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."FeatureFlag" AS ENUM (
    'ENABLED',
    'DISABLED',
    'BETA',
    'DEPRECATED'
);


ALTER TYPE public."FeatureFlag" OWNER TO postgres;

--
-- Name: KycStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."KycStatus" AS ENUM (
    'NOT_STARTED',
    'PENDING',
    'SUBMITTED',
    'UNDER_REVIEW',
    'APPROVED',
    'REJECTED',
    'EXPIRED',
    'ACTION_REQUIRED'
);


ALTER TYPE public."KycStatus" OWNER TO postgres;

--
-- Name: LogLevel; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."LogLevel" AS ENUM (
    'DEBUG',
    'INFO',
    'WARN',
    'ERROR',
    'FATAL'
);


ALTER TYPE public."LogLevel" OWNER TO postgres;

--
-- Name: MerchantStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."MerchantStatus" AS ENUM (
    'PENDING',
    'ACTIVE',
    'SUSPENDED',
    'REJECTED',
    'CLOSED',
    'UNDER_REVIEW'
);


ALTER TYPE public."MerchantStatus" OWNER TO postgres;

--
-- Name: NotificationChannel; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."NotificationChannel" AS ENUM (
    'EMAIL',
    'SMS',
    'PUSH',
    'WEBHOOK',
    'IN_APP',
    'SLACK'
);


ALTER TYPE public."NotificationChannel" OWNER TO postgres;

--
-- Name: NotificationType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."NotificationType" AS ENUM (
    'TRANSACTION',
    'SETTLEMENT',
    'SECURITY',
    'MERCHANT',
    'SYSTEM',
    'PROMOTIONAL',
    'COMPLIANCE',
    'DISPUTE',
    'PAYMENT'
);


ALTER TYPE public."NotificationType" OWNER TO postgres;

--
-- Name: PaymentStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PaymentStatus" AS ENUM (
    'PENDING',
    'AUTHORIZED',
    'CAPTURED',
    'SETTLED',
    'FAILED',
    'REFUNDED',
    'VOIDED',
    'CANCELLED',
    'EXPIRED'
);


ALTER TYPE public."PaymentStatus" OWNER TO postgres;

--
-- Name: PermissionType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."PermissionType" AS ENUM (
    'READ',
    'WRITE',
    'DELETE',
    'MANAGE',
    'EXECUTE'
);


ALTER TYPE public."PermissionType" OWNER TO postgres;

--
-- Name: RefundStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RefundStatus" AS ENUM (
    'REQUESTED',
    'APPROVED',
    'PROCESSING',
    'COMPLETED',
    'FAILED',
    'REJECTED'
);


ALTER TYPE public."RefundStatus" OWNER TO postgres;

--
-- Name: ReportType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ReportType" AS ENUM (
    'DAILY',
    'WEEKLY',
    'MONTHLY',
    'YEARLY',
    'CUSTOM'
);


ALTER TYPE public."ReportType" OWNER TO postgres;

--
-- Name: RiskLevel; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RiskLevel" AS ENUM (
    'LOW',
    'MEDIUM',
    'HIGH',
    'CRITICAL'
);


ALTER TYPE public."RiskLevel" OWNER TO postgres;

--
-- Name: SettlementStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SettlementStatus" AS ENUM (
    'PENDING',
    'PROCESSING',
    'COMPLETED',
    'FAILED',
    'QUEUED',
    'PARTIAL',
    'MANUAL_REVIEW'
);


ALTER TYPE public."SettlementStatus" OWNER TO postgres;

--
-- Name: SubscriptionPlan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SubscriptionPlan" AS ENUM (
    'FREE',
    'STARTER',
    'PRO',
    'BUSINESS',
    'ENTERPRISE',
    'CUSTOM'
);


ALTER TYPE public."SubscriptionPlan" OWNER TO postgres;

--
-- Name: SubscriptionStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SubscriptionStatus" AS ENUM (
    'ACTIVE',
    'EXPIRED',
    'CANCELLED',
    'PAST_DUE',
    'TRIAL',
    'SUSPENDED'
);


ALTER TYPE public."SubscriptionStatus" OWNER TO postgres;

--
-- Name: TerminalStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TerminalStatus" AS ENUM (
    'OFFLINE',
    'ONLINE',
    'MAINTENANCE',
    'DECOMMISSIONED',
    'UPDATING',
    'ERROR'
);


ALTER TYPE public."TerminalStatus" OWNER TO postgres;

--
-- Name: TransactionStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."TransactionStatus" AS ENUM (
    'INITIATED',
    'PENDING',
    'AUTHORIZED',
    'CAPTURED',
    'SETTLED',
    'FAILED',
    'REFUNDED',
    'PARTIAL_REFUND',
    'VOIDED',
    'CANCELLED',
    'REVERSED',
    'CHARGEBACK',
    'DISPUTED',
    'PENDING_REVIEW',
    'APPROVED',
    'DECLINED',
    'EXPIRED'
);


ALTER TYPE public."TransactionStatus" OWNER TO postgres;

--
-- Name: UserRole; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UserRole" AS ENUM (
    'SUPER_ADMIN',
    'ADMIN',
    'MERCHANT_ADMIN',
    'MERCHANT_USER',
    'CASHIER',
    'SUPPORT',
    'VIEWER',
    'ACCOUNTANT',
    'DEVELOPER'
);


ALTER TYPE public."UserRole" OWNER TO postgres;

--
-- Name: UserStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UserStatus" AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'SUSPENDED',
    'PENDING'
);


ALTER TYPE public."UserStatus" OWNER TO postgres;

--
-- Name: WalletStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."WalletStatus" AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'BLOCKED',
    'FROZEN',
    'CLOSED'
);


ALTER TYPE public."WalletStatus" OWNER TO postgres;

--
-- Name: WalletType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."WalletType" AS ENUM (
    'FIAT',
    'CRYPTO',
    'SETTLEMENT',
    'RESERVE',
    'HOT',
    'COLD',
    'OPERATIONAL'
);


ALTER TYPE public."WalletType" OWNER TO postgres;

--
-- Name: WebhookStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."WebhookStatus" AS ENUM (
    'PENDING',
    'DELIVERED',
    'FAILED',
    'RETRYING',
    'EXPIRED'
);


ALTER TYPE public."WebhookStatus" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AMLCheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AMLCheck" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    status public."AMLStatus" DEFAULT 'CLEAR'::public."AMLStatus" NOT NULL,
    flags jsonb,
    "riskScore" integer,
    "reviewedBy" text,
    "reviewNotes" text,
    metadata jsonb,
    "checkedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "reviewedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."AMLCheck" OWNER TO postgres;

--
-- Name: ActivityLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ActivityLog" (
    id text NOT NULL,
    "userId" text,
    "merchantId" text,
    activity text NOT NULL,
    description text,
    "ipAddress" text,
    "userAgent" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ActivityLog" OWNER TO postgres;

--
-- Name: AddressVerification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AddressVerification" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    "addressLine1" text,
    "addressLine2" text,
    city text,
    state text,
    "postalCode" text,
    country text,
    "proofDocument" text,
    "verificationResult" text,
    metadata jsonb,
    "verifiedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."AddressVerification" OWNER TO postgres;

--
-- Name: ApiKey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiKey" (
    id text NOT NULL,
    name text NOT NULL,
    "keyHash" text NOT NULL,
    "userId" text NOT NULL,
    "merchantId" text,
    permissions jsonb NOT NULL,
    status public."ApiKeyStatus" DEFAULT 'ACTIVE'::public."ApiKeyStatus" NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    "lastUsedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "revokedAt" timestamp(3) without time zone
);


ALTER TABLE public."ApiKey" OWNER TO postgres;

--
-- Name: ApiKeyUsage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiKeyUsage" (
    id text NOT NULL,
    "apiKeyId" text NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    "responseStatus" integer NOT NULL,
    "responseTime" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ApiKeyUsage" OWNER TO postgres;

--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Attendance" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status public."AttendanceStatus" DEFAULT 'PRESENT'::public."AttendanceStatus" NOT NULL,
    "clockInTime" timestamp(3) without time zone,
    "clockOutTime" timestamp(3) without time zone,
    "totalHours" numeric(10,2),
    "overtimeHours" numeric(10,2),
    notes text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Attendance" OWNER TO postgres;

--
-- Name: AuditLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AuditLog" (
    id text NOT NULL,
    "userId" text,
    "merchantId" text,
    "transactionId" text,
    action text NOT NULL,
    "entityType" text,
    "entityId" text,
    changes jsonb,
    "ipAddress" text,
    "userAgent" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AuditLog" OWNER TO postgres;

--
-- Name: Authorization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Authorization" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "authorizationCode" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status text NOT NULL,
    message text,
    "gatewayResponse" jsonb,
    "authorizedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Authorization" OWNER TO postgres;

--
-- Name: Backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Backup" (
    id text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    size integer,
    "fileUrl" text NOT NULL,
    checksum text,
    status text NOT NULL,
    scheduled boolean DEFAULT false NOT NULL,
    "startedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "completedAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Backup" OWNER TO postgres;

--
-- Name: BackupHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BackupHistory" (
    id text NOT NULL,
    "backupId" text NOT NULL,
    status text NOT NULL,
    message text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."BackupHistory" OWNER TO postgres;

--
-- Name: BankAccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BankAccount" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "accountName" text NOT NULL,
    "accountNumber" text NOT NULL,
    "bankName" text NOT NULL,
    "routingNumber" text,
    "swiftCode" text,
    iban text,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "accountType" text NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BankAccount" OWNER TO postgres;

--
-- Name: BlockchainConfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockchainConfirmation" (
    id text NOT NULL,
    "txId" text NOT NULL,
    confirmations integer NOT NULL,
    "blockHash" text,
    "blockTime" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."BlockchainConfirmation" OWNER TO postgres;

--
-- Name: BlockchainExplorer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockchainExplorer" (
    id text NOT NULL,
    "blockchainId" text NOT NULL,
    "explorerUrl" text NOT NULL,
    "apiUrl" text,
    "apiKey" text,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BlockchainExplorer" OWNER TO postgres;

--
-- Name: BlockchainFee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockchainFee" (
    id text NOT NULL,
    "blockchainId" text NOT NULL,
    "feeType" text NOT NULL,
    amount numeric(36,18) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."BlockchainFee" OWNER TO postgres;

--
-- Name: BlockchainNetwork; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockchainNetwork" (
    id text NOT NULL,
    name public."BlockchainNetworkType" NOT NULL,
    "chainId" integer,
    "nativeCurrency" public."CurrencyType" NOT NULL,
    "blockTime" integer NOT NULL,
    "explorerUrl" text,
    "rpcUrl" text,
    "wsUrl" text,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BlockchainNetwork" OWNER TO postgres;

--
-- Name: BlockchainTransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BlockchainTransaction" (
    id text NOT NULL,
    "txHash" text NOT NULL,
    "blockchainId" text NOT NULL,
    "walletId" text,
    "fromAddress" text NOT NULL,
    "toAddress" text NOT NULL,
    amount numeric(36,18) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    fee numeric(36,18) DEFAULT 0 NOT NULL,
    "gasUsed" integer,
    "gasPrice" numeric(36,18),
    "blockNumber" integer,
    "blockHash" text,
    confirmations integer DEFAULT 0 NOT NULL,
    status text NOT NULL,
    nonce integer,
    data jsonb,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."BlockchainTransaction" OWNER TO postgres;

--
-- Name: Brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brand" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    description text,
    logo text,
    website text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Brand" OWNER TO postgres;

--
-- Name: Capture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Capture" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status text NOT NULL,
    "capturedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "gatewayResponse" jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Capture" OWNER TO postgres;

--
-- Name: CardBIN; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CardBIN" (
    id text NOT NULL,
    bin text NOT NULL,
    brand public."CardBrand" NOT NULL,
    issuer text,
    "cardType" text,
    country text,
    "bankName" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CardBIN" OWNER TO postgres;

--
-- Name: CardPayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CardPayment" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "cardTokenId" text,
    "cardBrand" public."CardBrand" NOT NULL,
    "lastFour" text NOT NULL,
    "expiryMonth" integer NOT NULL,
    "expiryYear" integer NOT NULL,
    "cardHolderName" text,
    bin text,
    "gatewayResponse" jsonb,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CardPayment" OWNER TO postgres;

--
-- Name: CardToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CardToken" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "customerId" text,
    token text NOT NULL,
    provider text NOT NULL,
    "cardBrand" public."CardBrand" NOT NULL,
    "lastFour" text NOT NULL,
    "expiryMonth" integer NOT NULL,
    "expiryYear" integer NOT NULL,
    "cardHolderName" text,
    "isDefault" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CardToken" OWNER TO postgres;

--
-- Name: CashDrawer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CashDrawer" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    status text NOT NULL,
    "openCount" integer DEFAULT 0 NOT NULL,
    "lastOpenAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CashDrawer" OWNER TO postgres;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    description text,
    "parentId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: Chargeback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Chargeback" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "merchantId" text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."ChargebackStatus" DEFAULT 'INITIATED'::public."ChargebackStatus" NOT NULL,
    reason text,
    "chargebackCode" text,
    "reasonCode" text,
    "initiatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "resolvedAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Chargeback" OWNER TO postgres;

--
-- Name: ChargebackEvidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ChargebackEvidence" (
    id text NOT NULL,
    "chargebackId" text NOT NULL,
    type text NOT NULL,
    "fileUrl" text,
    description text,
    "uploadedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ChargebackEvidence" OWNER TO postgres;

--
-- Name: ClockIn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClockIn" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "clockInTime" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    location text,
    "deviceId" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ClockIn" OWNER TO postgres;

--
-- Name: ClockOut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClockOut" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "clockOutTime" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    location text,
    "deviceId" text,
    "totalHours" numeric(10,2),
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ClockOut" OWNER TO postgres;

--
-- Name: ColdWalletTransfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ColdWalletTransfer" (
    id text NOT NULL,
    "walletTransferId" text NOT NULL,
    "coldWalletAddress" text NOT NULL,
    amount numeric(18,8) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    status text NOT NULL,
    "signedTransaction" text,
    "broadcastTxHash" text,
    confirmations integer DEFAULT 0 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ColdWalletTransfer" OWNER TO postgres;

--
-- Name: Commission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Commission" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "transactionId" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    rate numeric(10,4),
    description text,
    paid boolean DEFAULT false NOT NULL,
    "paidAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Commission" OWNER TO postgres;

--
-- Name: ComplianceLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ComplianceLog" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    action text NOT NULL,
    details jsonb,
    "performedBy" text,
    "ipAddress" text,
    "userAgent" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ComplianceLog" OWNER TO postgres;

--
-- Name: ComplianceReview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ComplianceReview" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "reviewType" text NOT NULL,
    status text NOT NULL,
    findings jsonb,
    recommendations jsonb,
    "reviewerId" text,
    "reviewedAt" timestamp(3) without time zone,
    "dueDate" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ComplianceReview" OWNER TO postgres;

--
-- Name: CryptoAsset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CryptoAsset" (
    id text NOT NULL,
    symbol text NOT NULL,
    name text NOT NULL,
    type public."CryptoAssetType" DEFAULT 'COIN'::public."CryptoAssetType" NOT NULL,
    "blockchainId" text NOT NULL,
    "contractAddress" text,
    decimals integer DEFAULT 18 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CryptoAsset" OWNER TO postgres;

--
-- Name: CryptoConversion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CryptoConversion" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "fromCurrency" public."CurrencyType" NOT NULL,
    "toCurrency" public."CurrencyType" NOT NULL,
    "fromAmount" numeric(18,8) NOT NULL,
    "toAmount" numeric(18,8) NOT NULL,
    rate numeric(18,8) NOT NULL,
    fee numeric(18,8) DEFAULT 0 NOT NULL,
    status text NOT NULL,
    "exchangeProvider" text,
    "exchangeOrderId" text,
    "transactionId" text,
    "walletTransferId" text,
    metadata jsonb,
    "completedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CryptoConversion" OWNER TO postgres;

--
-- Name: CryptoQuote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CryptoQuote" (
    id text NOT NULL,
    "fromCurrency" public."CurrencyType" NOT NULL,
    "toCurrency" public."CurrencyType" NOT NULL,
    amount numeric(18,8) NOT NULL,
    "quoteAmount" numeric(18,8) NOT NULL,
    rate numeric(18,8) NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    provider text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CryptoQuote" OWNER TO postgres;

--
-- Name: CryptoRate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CryptoRate" (
    id text NOT NULL,
    "baseCurrency" public."CurrencyType" NOT NULL,
    "quoteCurrency" public."CurrencyType" NOT NULL,
    rate numeric(18,8) NOT NULL,
    source text NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CryptoRate" OWNER TO postgres;

--
-- Name: Customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customer" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    email text,
    phone text,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "displayName" text,
    avatar text,
    "addressLine1" text,
    "addressLine2" text,
    city text,
    state text,
    "postalCode" text,
    country text,
    language text DEFAULT 'en'::text NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status text NOT NULL,
    notes text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Customer" OWNER TO postgres;

--
-- Name: CustomerActivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerActivity" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    "activityType" text NOT NULL,
    description text,
    "ipAddress" text,
    "userAgent" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CustomerActivity" OWNER TO postgres;

--
-- Name: CustomerAddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerAddress" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    "addressLine1" text NOT NULL,
    "addressLine2" text,
    city text NOT NULL,
    state text,
    "postalCode" text,
    country text NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerAddress" OWNER TO postgres;

--
-- Name: CustomerCard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerCard" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    token text NOT NULL,
    "cardBrand" public."CardBrand" NOT NULL,
    "lastFour" text NOT NULL,
    "expiryMonth" integer NOT NULL,
    "expiryYear" integer NOT NULL,
    "cardHolderName" text,
    "isDefault" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerCard" OWNER TO postgres;

--
-- Name: CustomerDevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerDevice" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    "deviceId" text NOT NULL,
    "deviceName" text,
    "deviceType" text,
    os text,
    browser text,
    "ipAddress" text,
    "lastSeenAt" timestamp(3) without time zone,
    "isTrusted" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerDevice" OWNER TO postgres;

--
-- Name: CustomerLoyalty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerLoyalty" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    "loyaltyLevel" text NOT NULL,
    "pointsBalance" integer DEFAULT 0 NOT NULL,
    "lifetimePoints" integer DEFAULT 0 NOT NULL,
    "totalSpent" numeric(18,4) DEFAULT 0 NOT NULL,
    "totalTransactions" integer DEFAULT 0 NOT NULL,
    "lastTransactionAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerLoyalty" OWNER TO postgres;

--
-- Name: CustomerNotification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerNotification" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    type text NOT NULL,
    subject text,
    message text NOT NULL,
    "sentAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "readAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."CustomerNotification" OWNER TO postgres;

--
-- Name: CustomerReward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerReward" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    points integer DEFAULT 0 NOT NULL,
    "totalEarned" integer DEFAULT 0 NOT NULL,
    "totalRedeemed" integer DEFAULT 0 NOT NULL,
    tier text,
    "expiryDate" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerReward" OWNER TO postgres;

--
-- Name: CustomerWallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CustomerWallet" (
    id text NOT NULL,
    "customerId" text NOT NULL,
    address text NOT NULL,
    "blockchainId" text NOT NULL,
    currency public."CurrencyType" NOT NULL,
    "isPrimary" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."CustomerWallet" OWNER TO postgres;

--
-- Name: DashboardWidget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DashboardWidget" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    config jsonb NOT NULL,
    "position" jsonb NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."DashboardWidget" OWNER TO postgres;

--
-- Name: Department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Department" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    description text,
    "managerId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Department" OWNER TO postgres;

--
-- Name: Device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Device" (
    id text NOT NULL,
    "terminalId" text,
    name text NOT NULL,
    type text NOT NULL,
    model text,
    "serialNumber" text,
    status public."DeviceStatusEnum" DEFAULT 'CONNECTED'::public."DeviceStatusEnum" NOT NULL,
    "ipAddress" text,
    port integer,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Device" OWNER TO postgres;

--
-- Name: Dispute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dispute" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "merchantId" text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."DisputeStatus" DEFAULT 'OPEN'::public."DisputeStatus" NOT NULL,
    type text NOT NULL,
    reason text,
    "initiatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "resolvedAt" timestamp(3) without time zone,
    metadata jsonb,
    "chargebackId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Dispute" OWNER TO postgres;

--
-- Name: DisputeEvidence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DisputeEvidence" (
    id text NOT NULL,
    "disputeId" text NOT NULL,
    type text NOT NULL,
    "fileUrl" text,
    description text,
    "uploadedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."DisputeEvidence" OWNER TO postgres;

--
-- Name: EmailVerification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EmailVerification" (
    id text NOT NULL,
    token text NOT NULL,
    "userId" text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "verifiedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."EmailVerification" OWNER TO postgres;

--
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employee" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "userId" text,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    email text NOT NULL,
    phone text,
    role public."EmployeeRole" DEFAULT 'CASHIER'::public."EmployeeRole" NOT NULL,
    "departmentId" text,
    "hireDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "terminationDate" timestamp(3) without time zone,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- Name: ExchangeOrder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeOrder" (
    id text NOT NULL,
    "exchangeProviderId" text NOT NULL,
    "merchantId" text,
    "orderId" text,
    symbol text NOT NULL,
    side text NOT NULL,
    type text NOT NULL,
    price numeric(18,8),
    amount numeric(18,8) NOT NULL,
    "filledAmount" numeric(18,8) DEFAULT 0 NOT NULL,
    "avgPrice" numeric(18,8),
    status text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ExchangeOrder" OWNER TO postgres;

--
-- Name: ExchangeProvider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeProvider" (
    id text NOT NULL,
    name text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "apiKey" text,
    "apiSecret" text,
    "baseUrl" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ExchangeProvider" OWNER TO postgres;

--
-- Name: ExchangeQuote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeQuote" (
    id text NOT NULL,
    "exchangeProviderId" text NOT NULL,
    "fromCurrency" public."CurrencyType" NOT NULL,
    "toCurrency" public."CurrencyType" NOT NULL,
    "fromAmount" numeric(18,8) NOT NULL,
    "toAmount" numeric(18,8) NOT NULL,
    rate numeric(18,8) NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ExchangeQuote" OWNER TO postgres;

--
-- Name: ExchangeRate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeRate" (
    id text NOT NULL,
    "fromCurrency" public."CurrencyType" NOT NULL,
    "toCurrency" public."CurrencyType" NOT NULL,
    rate numeric(18,8) NOT NULL,
    source text NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ExchangeRate" OWNER TO postgres;

--
-- Name: ExchangeRateHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeRateHistory" (
    id text NOT NULL,
    "fromCurrency" public."CurrencyType" NOT NULL,
    "toCurrency" public."CurrencyType" NOT NULL,
    rate numeric(18,8) NOT NULL,
    source text NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ExchangeRateHistory" OWNER TO postgres;

--
-- Name: ExchangeTrade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ExchangeTrade" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "tradeId" text,
    price numeric(18,8) NOT NULL,
    amount numeric(18,8) NOT NULL,
    total numeric(18,8) NOT NULL,
    fee numeric(18,8) NOT NULL,
    "feeCurrency" public."CurrencyType" NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ExchangeTrade" OWNER TO postgres;

--
-- Name: GasHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GasHistory" (
    id text NOT NULL,
    "networkId" text NOT NULL,
    price numeric(36,18) NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."GasHistory" OWNER TO postgres;

--
-- Name: GasPrice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GasPrice" (
    id text NOT NULL,
    "networkId" text NOT NULL,
    price numeric(36,18) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."GasPrice" OWNER TO postgres;

--
-- Name: GatewayLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GatewayLog" (
    id text NOT NULL,
    "merchantId" text,
    provider text NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL,
    "requestPayload" jsonb,
    "responsePayload" jsonb,
    "statusCode" integer,
    error text,
    "responseTime" integer,
    "ipAddress" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."GatewayLog" OWNER TO postgres;

--
-- Name: GatewayRequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GatewayRequest" (
    id text NOT NULL,
    "transactionId" text,
    "providerId" text NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL,
    "requestBody" jsonb NOT NULL,
    "requestHeaders" jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."GatewayRequest" OWNER TO postgres;

--
-- Name: GatewayResponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GatewayResponse" (
    id text NOT NULL,
    "gatewayRequestId" text NOT NULL,
    "statusCode" integer NOT NULL,
    "responseBody" jsonb NOT NULL,
    "responseHeaders" jsonb NOT NULL,
    error text,
    "responseTime" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."GatewayResponse" OWNER TO postgres;

--
-- Name: HotWalletTransfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HotWalletTransfer" (
    id text NOT NULL,
    "walletTransferId" text NOT NULL,
    "hotWalletAddress" text NOT NULL,
    amount numeric(18,8) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    status text NOT NULL,
    "signedTransaction" text,
    "broadcastTxHash" text,
    confirmations integer DEFAULT 0 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."HotWalletTransfer" OWNER TO postgres;

--
-- Name: IdentityVerification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IdentityVerification" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    "identityNumber" text,
    "documentType" text NOT NULL,
    "documentNumber" text,
    "documentCountry" text,
    "documentExpiry" timestamp(3) without time zone,
    "verificationResult" text,
    "verificationData" jsonb,
    metadata jsonb,
    "verifiedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."IdentityVerification" OWNER TO postgres;

--
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "productId" text NOT NULL,
    quantity numeric(10,2) NOT NULL,
    "reservedQuantity" numeric(10,2) DEFAULT 0 NOT NULL,
    "availableQuantity" numeric(10,2) NOT NULL,
    "lowStockThreshold" numeric(10,2),
    location text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

--
-- Name: InventoryAdjustment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryAdjustment" (
    id text NOT NULL,
    "inventoryId" text NOT NULL,
    "productId" text NOT NULL,
    quantity numeric(10,2) NOT NULL,
    reason text NOT NULL,
    "approvedBy" text,
    note text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."InventoryAdjustment" OWNER TO postgres;

--
-- Name: InventoryMovement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."InventoryMovement" (
    id text NOT NULL,
    "inventoryId" text NOT NULL,
    "productId" text NOT NULL,
    quantity numeric(10,2) NOT NULL,
    type text NOT NULL,
    reference text,
    note text,
    "beforeQuantity" numeric(10,2) NOT NULL,
    "afterQuantity" numeric(10,2) NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."InventoryMovement" OWNER TO postgres;

--
-- Name: Kyc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kyc" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    status public."KycStatus" DEFAULT 'NOT_STARTED'::public."KycStatus" NOT NULL,
    type text NOT NULL,
    "firstName" text,
    "lastName" text,
    dob timestamp(3) without time zone,
    nationality text,
    address text,
    city text,
    state text,
    "postalCode" text,
    country text,
    "taxId" text,
    "registrationNumber" text,
    "businessName" text,
    "businessType" text,
    "businessAddress" text,
    "riskLevel" public."RiskLevel" DEFAULT 'LOW'::public."RiskLevel" NOT NULL,
    "amlStatus" public."AMLStatus" DEFAULT 'CLEAR'::public."AMLStatus" NOT NULL,
    "pepCheck" boolean DEFAULT false NOT NULL,
    "sanctionsCheck" boolean DEFAULT false NOT NULL,
    "reviewNotes" text,
    "submittedAt" timestamp(3) without time zone,
    "approvedAt" timestamp(3) without time zone,
    "rejectedAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Kyc" OWNER TO postgres;

--
-- Name: KycDocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KycDocument" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    type text NOT NULL,
    name text NOT NULL,
    "fileUrl" text NOT NULL,
    "verificationStatus" text NOT NULL,
    "rejectionReason" text,
    "uploadedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "verifiedAt" timestamp(3) without time zone,
    "expiresAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."KycDocument" OWNER TO postgres;

--
-- Name: KycReview; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KycReview" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    "reviewedBy" text,
    status public."KycStatus" NOT NULL,
    notes text,
    decision text,
    metadata jsonb,
    "reviewedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."KycReview" OWNER TO postgres;

--
-- Name: LiquidityPool; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LiquidityPool" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    "assetCurrency" public."CurrencyType" NOT NULL,
    "totalAmount" numeric(18,8) NOT NULL,
    "reservedAmount" numeric(18,8) DEFAULT 0 NOT NULL,
    "availableAmount" numeric(18,8) NOT NULL,
    "minBalance" numeric(18,8) NOT NULL,
    "maxBalance" numeric(18,8),
    status text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."LiquidityPool" OWNER TO postgres;

--
-- Name: LoginHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."LoginHistory" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    location text,
    success boolean NOT NULL,
    "failureReason" text,
    "deviceId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."LoginHistory" OWNER TO postgres;

--
-- Name: Merchant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Merchant" (
    id text NOT NULL,
    name text NOT NULL,
    "legalName" text,
    "businessType" text NOT NULL,
    "registrationNumber" text,
    "taxId" text,
    email text NOT NULL,
    phone text,
    website text,
    timezone text DEFAULT 'UTC'::text NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."MerchantStatus" DEFAULT 'PENDING'::public."MerchantStatus" NOT NULL,
    description text,
    logo text,
    "contactEmail" text,
    "contactPhone" text,
    "addressLine1" text,
    "addressLine2" text,
    city text,
    state text,
    "postalCode" text,
    country text,
    "isVerified" boolean DEFAULT false NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Merchant" OWNER TO postgres;

--
-- Name: MerchantAddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantAddress" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    type text NOT NULL,
    "addressLine1" text NOT NULL,
    "addressLine2" text,
    city text NOT NULL,
    state text,
    "postalCode" text,
    country text NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantAddress" OWNER TO postgres;

--
-- Name: MerchantBranding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantBranding" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "companyName" text,
    logo text,
    favicon text,
    "primaryColor" text,
    "secondaryColor" text,
    font text,
    "emailFooter" text,
    "receiptHeader" text,
    "receiptFooter" text,
    "invoiceLogo" text,
    website text,
    "socialLinks" jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantBranding" OWNER TO postgres;

--
-- Name: MerchantBusinessHours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantBusinessHours" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "dayOfWeek" integer NOT NULL,
    "openTime" text,
    "closeTime" text,
    "isClosed" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantBusinessHours" OWNER TO postgres;

--
-- Name: MerchantCompliance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantCompliance" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "riskLevel" public."RiskLevel" DEFAULT 'LOW'::public."RiskLevel" NOT NULL,
    "amlStatus" public."AMLStatus" DEFAULT 'CLEAR'::public."AMLStatus" NOT NULL,
    "kycStatus" public."KycStatus" DEFAULT 'NOT_STARTED'::public."KycStatus" NOT NULL,
    "lastReviewDate" timestamp(3) without time zone,
    "nextReviewDate" timestamp(3) without time zone,
    "pepCheck" boolean DEFAULT false NOT NULL,
    "sanctionsCheck" boolean DEFAULT false NOT NULL,
    "restrictedCountries" jsonb,
    notes text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantCompliance" OWNER TO postgres;

--
-- Name: MerchantContact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantContact" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    email text NOT NULL,
    phone text,
    role text,
    "isPrimary" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantContact" OWNER TO postgres;

--
-- Name: MerchantDocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantDocument" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    type text NOT NULL,
    name text NOT NULL,
    "fileUrl" text NOT NULL,
    "verificationStatus" text NOT NULL,
    "rejectionReason" text,
    "uploadedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "verifiedAt" timestamp(3) without time zone,
    "expiresAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantDocument" OWNER TO postgres;

--
-- Name: MerchantFeature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantFeature" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "featureName" text NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    config jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantFeature" OWNER TO postgres;

--
-- Name: MerchantFee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantFee" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    type text NOT NULL,
    amount numeric(18,4),
    rate numeric(18,6),
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "appliesTo" text,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantFee" OWNER TO postgres;

--
-- Name: MerchantLimits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantLimits" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "dailyTransactionLimit" numeric(18,4),
    "weeklyTransactionLimit" numeric(18,4),
    "monthlyTransactionLimit" numeric(18,4),
    "dailyTransactionCount" integer,
    "weeklyTransactionCount" integer,
    "monthlyTransactionCount" integer,
    "perTransactionMax" numeric(18,4),
    "perTransactionMin" numeric(18,4),
    "settlementLimit" numeric(18,4),
    "cryptoConversionLimit" numeric(18,4),
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantLimits" OWNER TO postgres;

--
-- Name: MerchantNotificationSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantNotificationSettings" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "emailNotifications" boolean DEFAULT true NOT NULL,
    "smsNotifications" boolean DEFAULT false NOT NULL,
    "pushNotifications" boolean DEFAULT false NOT NULL,
    "webhookNotifications" boolean DEFAULT false NOT NULL,
    "transactionEmails" boolean DEFAULT true NOT NULL,
    "settlementEmails" boolean DEFAULT true NOT NULL,
    "securityEmails" boolean DEFAULT true NOT NULL,
    "promotionalEmails" boolean DEFAULT false NOT NULL,
    "complianceEmails" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantNotificationSettings" OWNER TO postgres;

--
-- Name: MerchantSecuritySettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantSecuritySettings" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "mfaRequired" boolean DEFAULT false NOT NULL,
    "passwordPolicy" jsonb,
    "sessionTimeout" integer DEFAULT 3600 NOT NULL,
    "ipWhitelistEnabled" boolean DEFAULT false NOT NULL,
    "ipWhitelist" jsonb,
    "webhookSecret" text,
    "apiKeyRotationDays" integer DEFAULT 90 NOT NULL,
    "auditLogRetentionDays" integer DEFAULT 365 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantSecuritySettings" OWNER TO postgres;

--
-- Name: MerchantSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantSettings" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "receiptFooter" text,
    "receiptLogo" text,
    "autoSettlement" boolean DEFAULT true NOT NULL,
    "settlementThreshold" numeric(18,4),
    "defaultCurrency" public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    timezone text DEFAULT 'UTC'::text NOT NULL,
    language text DEFAULT 'en'::text NOT NULL,
    "ipWhitelist" jsonb,
    "maxTransactionAmount" numeric(18,4),
    "minTransactionAmount" numeric(18,4),
    "allowRefunds" boolean DEFAULT true NOT NULL,
    "allowChargebacks" boolean DEFAULT true NOT NULL,
    "allowPartialSettlement" boolean DEFAULT false NOT NULL,
    "settlementAccountId" text,
    "defaultGatewayProviderId" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantSettings" OWNER TO postgres;

--
-- Name: MerchantSubscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantSubscription" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    plan public."SubscriptionPlan" DEFAULT 'FREE'::public."SubscriptionPlan" NOT NULL,
    status public."SubscriptionStatus" DEFAULT 'ACTIVE'::public."SubscriptionStatus" NOT NULL,
    "startDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiryDate" timestamp(3) without time zone,
    "trialEndsAt" timestamp(3) without time zone,
    "autoRenew" boolean DEFAULT false NOT NULL,
    amount numeric(18,4),
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "paymentMethod" text,
    "lastPaymentDate" timestamp(3) without time zone,
    "nextPaymentDate" timestamp(3) without time zone,
    "featureLimits" jsonb,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantSubscription" OWNER TO postgres;

--
-- Name: MerchantWebhookSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MerchantWebhookSettings" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    url text NOT NULL,
    secret text,
    events jsonb NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    "retryCount" integer DEFAULT 3 NOT NULL,
    "retryDelay" integer DEFAULT 60 NOT NULL,
    timeout integer DEFAULT 30 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."MerchantWebhookSettings" OWNER TO postgres;

--
-- Name: Notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notification" (
    id text NOT NULL,
    "merchantId" text,
    "userId" text,
    "customerId" text,
    type public."NotificationType" DEFAULT 'SYSTEM'::public."NotificationType" NOT NULL,
    channel public."NotificationChannel" DEFAULT 'IN_APP'::public."NotificationChannel" NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
    data jsonb,
    "readAt" timestamp(3) without time zone,
    "deliveredAt" timestamp(3) without time zone,
    "sentAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Notification" OWNER TO postgres;

--
-- Name: NotificationLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NotificationLog" (
    id text NOT NULL,
    "notificationId" text NOT NULL,
    channel public."NotificationChannel" NOT NULL,
    status text NOT NULL,
    error text,
    "sentAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."NotificationLog" OWNER TO postgres;

--
-- Name: OAuthAccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OAuthAccount" (
    id text NOT NULL,
    "userId" text NOT NULL,
    provider text NOT NULL,
    "providerId" text NOT NULL,
    email text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "expiresAt" timestamp(3) without time zone,
    "tokenType" text,
    scope text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."OAuthAccount" OWNER TO postgres;

--
-- Name: PEPCheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PEPCheck" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    name text NOT NULL,
    matched boolean NOT NULL,
    "position" text,
    country text,
    reference text,
    metadata jsonb,
    "checkedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."PEPCheck" OWNER TO postgres;

--
-- Name: PasswordReset; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PasswordReset" (
    id text NOT NULL,
    token text NOT NULL,
    "userId" text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "usedAt" timestamp(3) without time zone,
    used boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PasswordReset" OWNER TO postgres;

--
-- Name: PaymentAttempt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentAttempt" (
    id text NOT NULL,
    "paymentIntentId" text NOT NULL,
    "transactionId" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."PaymentStatus" DEFAULT 'PENDING'::public."PaymentStatus" NOT NULL,
    "gatewayResponse" jsonb,
    "errorMessage" text,
    "attemptedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PaymentAttempt" OWNER TO postgres;

--
-- Name: PaymentIntent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentIntent" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "customerId" text,
    "paymentMethodId" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."PaymentStatus" DEFAULT 'PENDING'::public."PaymentStatus" NOT NULL,
    description text,
    "clientSecret" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "expiresAt" timestamp(3) without time zone
);


ALTER TABLE public."PaymentIntent" OWNER TO postgres;

--
-- Name: PaymentMethod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentMethod" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "customerId" text,
    type text NOT NULL,
    provider text,
    token text,
    "lastFour" text,
    "expiryMonth" integer,
    "expiryYear" integer,
    "isDefault" boolean DEFAULT false NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PaymentMethod" OWNER TO postgres;

--
-- Name: PaymentProvider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PaymentProvider" (
    id text NOT NULL,
    name text NOT NULL,
    "displayName" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "configSchema" jsonb,
    "baseUrl" text,
    priority integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PaymentProvider" OWNER TO postgres;

--
-- Name: Payroll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payroll" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "employeeId" text NOT NULL,
    "periodStart" timestamp(3) without time zone NOT NULL,
    "periodEnd" timestamp(3) without time zone NOT NULL,
    "basePay" numeric(18,4) NOT NULL,
    "overtimePay" numeric(18,4) DEFAULT 0 NOT NULL,
    "bonusPay" numeric(18,4) DEFAULT 0 NOT NULL,
    deductions numeric(18,4) DEFAULT 0 NOT NULL,
    "netPay" numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status text NOT NULL,
    "paidAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Payroll" OWNER TO postgres;

--
-- Name: Permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permission" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    resource text NOT NULL,
    action public."PermissionType" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Permission" OWNER TO postgres;

--
-- Name: Printer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Printer" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    type text NOT NULL,
    "paperSize" text,
    "characterSet" text,
    "autoCut" boolean DEFAULT true NOT NULL,
    "lineSpacing" integer,
    "printSpeed" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Printer" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    description text,
    sku text NOT NULL,
    barcode text,
    price numeric(18,4) NOT NULL,
    cost numeric(18,4),
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "categoryId" text,
    "brandId" text,
    weight numeric(10,2),
    dimensions jsonb,
    "isTaxable" boolean DEFAULT true NOT NULL,
    "taxRate" numeric(10,4),
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProviderMetric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProviderMetric" (
    id text NOT NULL,
    provider text NOT NULL,
    requests integer DEFAULT 0 NOT NULL,
    successes integer DEFAULT 0 NOT NULL,
    failures integer DEFAULT 0 NOT NULL,
    "averageResponseTime" double precision DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ProviderMetric" OWNER TO postgres;

--
-- Name: ProviderResponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProviderResponse" (
    id text NOT NULL,
    "providerId" text NOT NULL,
    "requestId" text,
    "statusCode" integer NOT NULL,
    body jsonb NOT NULL,
    headers jsonb,
    error text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ProviderResponse" OWNER TO postgres;

--
-- Name: Purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Purchase" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "supplierId" text NOT NULL,
    reference text,
    "purchaseDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "totalAmount" numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Purchase" OWNER TO postgres;

--
-- Name: PurchaseItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PurchaseItem" (
    id text NOT NULL,
    "purchaseId" text NOT NULL,
    "productId" text NOT NULL,
    quantity numeric(10,2) NOT NULL,
    "unitPrice" numeric(18,4) NOT NULL,
    "totalPrice" numeric(18,4) NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."PurchaseItem" OWNER TO postgres;

--
-- Name: ReceiptTemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReceiptTemplate" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    content text NOT NULL,
    "isDefault" boolean DEFAULT false NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ReceiptTemplate" OWNER TO postgres;

--
-- Name: RefreshToken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RefreshToken" (
    id text NOT NULL,
    token text NOT NULL,
    "userId" text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    revoked boolean DEFAULT false NOT NULL,
    "replacedBy" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."RefreshToken" OWNER TO postgres;

--
-- Name: Refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Refund" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "merchantId" text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."RefundStatus" DEFAULT 'REQUESTED'::public."RefundStatus" NOT NULL,
    reason text,
    "refundReference" text,
    "gatewayRefundId" text,
    "processedAt" timestamp(3) without time zone,
    metadata jsonb,
    "refundReasonId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Refund" OWNER TO postgres;

--
-- Name: RefundReason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RefundReason" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    reason text NOT NULL,
    description text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."RefundReason" OWNER TO postgres;

--
-- Name: Report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Report" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    type public."ReportType" DEFAULT 'DAILY'::public."ReportType" NOT NULL,
    name text NOT NULL,
    parameters jsonb,
    data jsonb,
    "fileUrl" text,
    format text,
    status text NOT NULL,
    "generatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "completedAt" timestamp(3) without time zone,
    "expiresAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Report" OWNER TO postgres;

--
-- Name: ReportExport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ReportExport" (
    id text NOT NULL,
    "reportId" text NOT NULL,
    format text NOT NULL,
    "fileUrl" text NOT NULL,
    "fileSize" integer,
    "generatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "expiresAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."ReportExport" OWNER TO postgres;

--
-- Name: Reversal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Reversal" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    reason text,
    status text NOT NULL,
    "reversedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "gatewayResponse" jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Reversal" OWNER TO postgres;

--
-- Name: RiskAssessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RiskAssessment" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    score integer NOT NULL,
    level public."RiskLevel" DEFAULT 'LOW'::public."RiskLevel" NOT NULL,
    factors jsonb,
    "recommendedAction" text,
    metadata jsonb,
    "assessedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RiskAssessment" OWNER TO postgres;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    "isSystem" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermission" (
    id text NOT NULL,
    "roleId" text NOT NULL,
    "permissionId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."RolePermission" OWNER TO postgres;

--
-- Name: Salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Salary" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "baseSalary" numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "payFrequency" text NOT NULL,
    "effectiveDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endDate" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Salary" OWNER TO postgres;

--
-- Name: SanctionCheck; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SanctionCheck" (
    id text NOT NULL,
    "kycId" text NOT NULL,
    name text NOT NULL,
    alias text,
    matched boolean NOT NULL,
    "riskScore" integer,
    "listName" text,
    reference text,
    metadata jsonb,
    "checkedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."SanctionCheck" OWNER TO postgres;

--
-- Name: Scanner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Scanner" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    type text NOT NULL,
    model text,
    resolution text,
    "scanningMode" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Scanner" OWNER TO postgres;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "sessionId" text NOT NULL,
    "userId" text NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    "deviceInfo" jsonb,
    "isActive" boolean DEFAULT true NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO postgres;

--
-- Name: Settlement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Settlement" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "batchId" text,
    "walletId" text NOT NULL,
    "bankAccountId" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    fee numeric(18,4) DEFAULT 0 NOT NULL,
    "netAmount" numeric(18,4) NOT NULL,
    status public."SettlementStatus" DEFAULT 'PENDING'::public."SettlementStatus" NOT NULL,
    "requestedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "processedAt" timestamp(3) without time zone,
    "completedAt" timestamp(3) without time zone,
    reference text,
    metadata jsonb,
    "attemptCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Settlement" OWNER TO postgres;

--
-- Name: SettlementAttempt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettlementAttempt" (
    id text NOT NULL,
    "settlementId" text NOT NULL,
    "attemptNumber" integer NOT NULL,
    status public."SettlementStatus" DEFAULT 'PENDING'::public."SettlementStatus" NOT NULL,
    "errorMessage" text,
    response jsonb,
    "startedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "completedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SettlementAttempt" OWNER TO postgres;

--
-- Name: SettlementBatch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettlementBatch" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "batchReference" text NOT NULL,
    "totalAmount" numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    "totalFees" numeric(18,4) DEFAULT 0 NOT NULL,
    "totalNet" numeric(18,4) NOT NULL,
    "transactionCount" integer DEFAULT 0 NOT NULL,
    status public."SettlementStatus" DEFAULT 'PENDING'::public."SettlementStatus" NOT NULL,
    "processedAt" timestamp(3) without time zone,
    "completedAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SettlementBatch" OWNER TO postgres;

--
-- Name: SettlementFee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettlementFee" (
    id text NOT NULL,
    "settlementId" text NOT NULL,
    name text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SettlementFee" OWNER TO postgres;

--
-- Name: SettlementRule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettlementRule" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    condition jsonb NOT NULL,
    action text NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SettlementRule" OWNER TO postgres;

--
-- Name: SettlementSchedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SettlementSchedule" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    frequency text NOT NULL,
    "dayOfWeek" integer,
    "dayOfMonth" integer,
    "timeOfDay" text,
    "minAmount" numeric(18,4),
    "maxAmount" numeric(18,4),
    "isActive" boolean DEFAULT true NOT NULL,
    "lastRunAt" timestamp(3) without time zone,
    "nextRunAt" timestamp(3) without time zone,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SettlementSchedule" OWNER TO postgres;

--
-- Name: Shift; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shift" (
    id text NOT NULL,
    "employeeId" text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone,
    "breakDuration" integer,
    "totalHours" numeric(10,2),
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Shift" OWNER TO postgres;

--
-- Name: Supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Supplier" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    email text,
    phone text,
    address text,
    "contactPerson" text,
    "taxId" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Supplier" OWNER TO postgres;

--
-- Name: SystemConfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SystemConfiguration" (
    id text NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL,
    type text NOT NULL,
    description text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SystemConfiguration" OWNER TO postgres;

--
-- Name: SystemSetting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SystemSetting" (
    id text NOT NULL,
    "merchantId" text,
    key text NOT NULL,
    value jsonb NOT NULL,
    type text NOT NULL,
    description text,
    "isGlobal" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SystemSetting" OWNER TO postgres;

--
-- Name: Terminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Terminal" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "serialNumber" text NOT NULL,
    model text NOT NULL,
    manufacturer text NOT NULL,
    "firmwareVersion" text,
    "softwareVersion" text,
    status public."TerminalStatus" DEFAULT 'OFFLINE'::public."TerminalStatus" NOT NULL,
    location text,
    "ipAddress" text,
    "macAddress" text,
    "lastHeartbeatAt" timestamp(3) without time zone,
    "lastBootAt" timestamp(3) without time zone,
    "lastTransactionAt" timestamp(3) without time zone,
    "batteryLevel" integer,
    "storageUsed" integer,
    "memoryUsed" integer,
    "terminalGroupId" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Terminal" OWNER TO postgres;

--
-- Name: TerminalConfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalConfiguration" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    "receiptHeader" text,
    "receiptFooter" text,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    timezone text DEFAULT 'UTC'::text NOT NULL,
    language text DEFAULT 'en'::text NOT NULL,
    "printerEnabled" boolean DEFAULT true NOT NULL,
    "autoPrint" boolean DEFAULT true NOT NULL,
    "signatureRequired" boolean DEFAULT false NOT NULL,
    "tipsEnabled" boolean DEFAULT false NOT NULL,
    "tipPercentages" jsonb,
    "cashbackEnabled" boolean DEFAULT false NOT NULL,
    "cashbackLimit" numeric(18,4),
    "offlineMode" boolean DEFAULT false NOT NULL,
    "maxOfflineTransactions" integer DEFAULT 100 NOT NULL,
    "settlementSchedule" text,
    "gatewayOverride" text,
    theme text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TerminalConfiguration" OWNER TO postgres;

--
-- Name: TerminalGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalGroup" (
    id text NOT NULL,
    name text NOT NULL,
    "merchantId" text NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TerminalGroup" OWNER TO postgres;

--
-- Name: TerminalHeartbeat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalHeartbeat" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    status public."TerminalStatus" NOT NULL,
    uptime integer,
    battery integer,
    "memoryUsage" integer,
    "cpuUsage" integer,
    "storageFree" integer,
    "networkStatus" text,
    "ipAddress" text,
    geolocation jsonb,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TerminalHeartbeat" OWNER TO postgres;

--
-- Name: TerminalKey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalKey" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    "keyType" text NOT NULL,
    "keyHash" text NOT NULL,
    label text,
    "expiresAt" timestamp(3) without time zone,
    "lastUsedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TerminalKey" OWNER TO postgres;

--
-- Name: TerminalLocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalLocation" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    "storeName" text,
    address text,
    latitude numeric(10,8),
    longitude numeric(11,8),
    city text,
    state text,
    country text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TerminalLocation" OWNER TO postgres;

--
-- Name: TerminalLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalLog" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    level public."LogLevel" DEFAULT 'INFO'::public."LogLevel" NOT NULL,
    message text NOT NULL,
    "stackTrace" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TerminalLog" OWNER TO postgres;

--
-- Name: TerminalSoftware; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TerminalSoftware" (
    id text NOT NULL,
    "terminalId" text NOT NULL,
    version text NOT NULL,
    "releaseNotes" text,
    "installedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status text NOT NULL,
    checksum text,
    "fileUrl" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TerminalSoftware" OWNER TO postgres;

--
-- Name: Transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transaction" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "terminalId" text,
    "customerId" text,
    "walletId" text,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    status public."TransactionStatus" DEFAULT 'INITIATED'::public."TransactionStatus" NOT NULL,
    type text NOT NULL,
    reference text,
    description text,
    "gatewayTransactionId" text,
    "gatewayProvider" text,
    "approvalCode" text,
    "paymentMethod" text NOT NULL,
    "cardBrand" public."CardBrand",
    "cardLastFour" text,
    "cardExpiry" text,
    "authCode" text,
    "customerIP" text,
    "customerUserAgent" text,
    metadata jsonb,
    "feeAmount" numeric(18,4),
    "feeCurrency" public."CurrencyType",
    "netAmount" numeric(18,4),
    "settlementStatus" public."SettlementStatus" DEFAULT 'PENDING'::public."SettlementStatus" NOT NULL,
    "settlementAmount" numeric(18,4),
    "settlementCurrency" public."CurrencyType",
    "settlementDate" timestamp(3) without time zone,
    "cryptoConversionId" text,
    "cryptoAmount" numeric(36,18),
    "cryptoCurrency" public."CurrencyType",
    "blockchainTransactionId" text,
    "paymentIntentId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Transaction" OWNER TO postgres;

--
-- Name: TransactionDiscount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionDiscount" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    name text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TransactionDiscount" OWNER TO postgres;

--
-- Name: TransactionEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionEvent" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "eventType" text NOT NULL,
    status text NOT NULL,
    description text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TransactionEvent" OWNER TO postgres;

--
-- Name: TransactionFee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionFee" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "walletId" text,
    name text NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    type text NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TransactionFee" OWNER TO postgres;

--
-- Name: TransactionItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionItem" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "productId" text,
    sku text,
    name text NOT NULL,
    description text,
    quantity numeric(10,2) NOT NULL,
    "unitPrice" numeric(18,4) NOT NULL,
    "totalPrice" numeric(18,4) NOT NULL,
    "discountAmount" numeric(18,4) DEFAULT 0 NOT NULL,
    "taxAmount" numeric(18,4) DEFAULT 0 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TransactionItem" OWNER TO postgres;

--
-- Name: TransactionMetadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionMetadata" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    key text NOT NULL,
    value jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TransactionMetadata" OWNER TO postgres;

--
-- Name: TransactionStatusHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionStatusHistory" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    "oldStatus" public."TransactionStatus" NOT NULL,
    "newStatus" public."TransactionStatus" NOT NULL,
    "changedBy" text,
    reason text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TransactionStatusHistory" OWNER TO postgres;

--
-- Name: TransactionTax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionTax" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    name text NOT NULL,
    rate numeric(10,4) NOT NULL,
    amount numeric(18,4) NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."TransactionTax" OWNER TO postgres;

--
-- Name: TransactionTimeline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransactionTimeline" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    step text NOT NULL,
    status text NOT NULL,
    message text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TransactionTimeline" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    phone text,
    "passwordHash" text,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "displayName" text,
    avatar text,
    role public."UserRole" DEFAULT 'VIEWER'::public."UserRole" NOT NULL,
    status public."UserStatus",
    "lastLoginAt" timestamp(3) without time zone,
    "lastLoginIP" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    "isMFAEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" text,
    "backupCodes" jsonb,
    "passwordResetToken" text,
    "passwordResetExpires" timestamp(3) without time zone,
    "emailVerifyToken" text,
    "emailVerifyExpires" timestamp(3) without time zone,
    "deletedAt" timestamp(3) without time zone,
    "merchantId" text,
    "assignedRoleId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserPermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserPermission" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "permissionId" text NOT NULL,
    "grantedBy" text,
    "grantedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "revokedAt" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserPermission" OWNER TO postgres;

--
-- Name: VoidTransaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VoidTransaction" (
    id text NOT NULL,
    "transactionId" text NOT NULL,
    reason text,
    status text NOT NULL,
    "voidedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "gatewayResponse" jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."VoidTransaction" OWNER TO postgres;

--
-- Name: Wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wallet" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    name text NOT NULL,
    type public."WalletType" DEFAULT 'FIAT'::public."WalletType" NOT NULL,
    currency public."CurrencyType" DEFAULT 'USD'::public."CurrencyType" NOT NULL,
    balance numeric(18,8) DEFAULT 0 NOT NULL,
    "reservedBalance" numeric(18,8) DEFAULT 0 NOT NULL,
    "availableBalance" numeric(18,8) DEFAULT 0 NOT NULL,
    status public."WalletStatus" DEFAULT 'ACTIVE'::public."WalletStatus" NOT NULL,
    address text,
    "blockchainId" text,
    "encryptedPrivateKey" text,
    "publicKey" text,
    "bankAccountId" text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Wallet" OWNER TO postgres;

--
-- Name: WalletAddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WalletAddress" (
    id text NOT NULL,
    "walletId" text NOT NULL,
    address text NOT NULL,
    "blockchainId" text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    label text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."WalletAddress" OWNER TO postgres;

--
-- Name: WalletAudit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WalletAudit" (
    id text NOT NULL,
    "walletId" text NOT NULL,
    action text NOT NULL,
    amount numeric(18,8) NOT NULL,
    "balanceBefore" numeric(18,8) NOT NULL,
    "balanceAfter" numeric(18,8) NOT NULL,
    reference text,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."WalletAudit" OWNER TO postgres;

--
-- Name: WalletBalance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WalletBalance" (
    id text NOT NULL,
    "walletId" text NOT NULL,
    "assetType" public."CurrencyType" NOT NULL,
    balance numeric(18,8) NOT NULL,
    reserved numeric(18,8) DEFAULT 0 NOT NULL,
    available numeric(18,8) NOT NULL,
    "snapshotAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."WalletBalance" OWNER TO postgres;

--
-- Name: WalletKey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WalletKey" (
    id text NOT NULL,
    "walletId" text NOT NULL,
    "keyType" text NOT NULL,
    "encryptedKey" text NOT NULL,
    "keyHash" text NOT NULL,
    label text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."WalletKey" OWNER TO postgres;

--
-- Name: WalletTransfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WalletTransfer" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "fromWalletId" text NOT NULL,
    "toWalletId" text NOT NULL,
    amount numeric(18,8) NOT NULL,
    currency public."CurrencyType" NOT NULL,
    fee numeric(18,8) DEFAULT 0 NOT NULL,
    status text NOT NULL,
    type text NOT NULL,
    reference text,
    "blockchainTxId" text,
    metadata jsonb,
    "completedAt" timestamp(3) without time zone,
    "cryptoConversionId" text,
    "refundId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."WalletTransfer" OWNER TO postgres;

--
-- Name: Webhook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Webhook" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    url text NOT NULL,
    secret text,
    events jsonb NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "retryCount" integer DEFAULT 3 NOT NULL,
    "retryDelay" integer DEFAULT 60 NOT NULL,
    timeout integer DEFAULT 30 NOT NULL,
    "lastDeliveryAt" timestamp(3) without time zone,
    "lastSuccessAt" timestamp(3) without time zone,
    "lastFailureAt" timestamp(3) without time zone,
    "failureCount" integer DEFAULT 0 NOT NULL,
    metadata jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Webhook" OWNER TO postgres;

--
-- Name: WebhookDelivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WebhookDelivery" (
    id text NOT NULL,
    "webhookId" text NOT NULL,
    event text NOT NULL,
    payload jsonb NOT NULL,
    status public."WebhookStatus" DEFAULT 'PENDING'::public."WebhookStatus" NOT NULL,
    "responseStatus" integer,
    "responseBody" text,
    error text,
    attempts integer DEFAULT 0 NOT NULL,
    "deliveredAt" timestamp(3) without time zone,
    "nextRetryAt" timestamp(3) without time zone,
    "transactionId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."WebhookDelivery" OWNER TO postgres;

--
-- Name: WebhookEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WebhookEvent" (
    id text NOT NULL,
    "merchantId" text NOT NULL,
    "eventName" text NOT NULL,
    "eventData" jsonb NOT NULL,
    delivered boolean DEFAULT false NOT NULL,
    "deliveredAt" timestamp(3) without time zone,
    error text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."WebhookEvent" OWNER TO postgres;

--
-- Name: WebhookRetry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WebhookRetry" (
    id text NOT NULL,
    "webhookDeliveryId" text NOT NULL,
    "attemptNumber" integer NOT NULL,
    "scheduledAt" timestamp(3) without time zone NOT NULL,
    "executedAt" timestamp(3) without time zone,
    status public."WebhookStatus" DEFAULT 'PENDING'::public."WebhookStatus" NOT NULL,
    "responseStatus" integer,
    error text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."WebhookRetry" OWNER TO postgres;

--
-- Data for Name: AMLCheck; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AMLCheck" (id, "kycId", status, flags, "riskScore", "reviewedBy", "reviewNotes", metadata, "checkedAt", "reviewedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ActivityLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ActivityLog" (id, "userId", "merchantId", activity, description, "ipAddress", "userAgent", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: AddressVerification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AddressVerification" (id, "kycId", "addressLine1", "addressLine2", city, state, "postalCode", country, "proofDocument", "verificationResult", metadata, "verifiedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ApiKey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiKey" (id, name, "keyHash", "userId", "merchantId", permissions, status, "expiresAt", "lastUsedAt", "createdAt", "updatedAt", "revokedAt") FROM stdin;
\.


--
-- Data for Name: ApiKeyUsage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiKeyUsage" (id, "apiKeyId", endpoint, method, "ipAddress", "userAgent", "responseStatus", "responseTime", "createdAt") FROM stdin;
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Attendance" (id, "employeeId", date, status, "clockInTime", "clockOutTime", "totalHours", "overtimeHours", notes, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: AuditLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AuditLog" (id, "userId", "merchantId", "transactionId", action, "entityType", "entityId", changes, "ipAddress", "userAgent", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: Authorization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Authorization" (id, "transactionId", "authorizationCode", amount, currency, status, message, "gatewayResponse", "authorizedAt", "expiresAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Backup" (id, name, type, size, "fileUrl", checksum, status, scheduled, "startedAt", "completedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: BackupHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BackupHistory" (id, "backupId", status, message, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: BankAccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BankAccount" (id, "merchantId", "accountName", "accountNumber", "bankName", "routingNumber", "swiftCode", iban, currency, "accountType", "isDefault", "isVerified", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: BlockchainConfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockchainConfirmation" (id, "txId", confirmations, "blockHash", "blockTime", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: BlockchainExplorer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockchainExplorer" (id, "blockchainId", "explorerUrl", "apiUrl", "apiKey", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: BlockchainFee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockchainFee" (id, "blockchainId", "feeType", amount, currency, "timestamp", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: BlockchainNetwork; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockchainNetwork" (id, name, "chainId", "nativeCurrency", "blockTime", "explorerUrl", "rpcUrl", "wsUrl", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: BlockchainTransaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BlockchainTransaction" (id, "txHash", "blockchainId", "walletId", "fromAddress", "toAddress", amount, currency, fee, "gasUsed", "gasPrice", "blockNumber", "blockHash", confirmations, status, nonce, data, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Brand" (id, "merchantId", name, description, logo, website, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Capture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Capture" (id, "transactionId", amount, currency, status, "capturedAt", "gatewayResponse", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CardBIN; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CardBIN" (id, bin, brand, issuer, "cardType", country, "bankName", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CardPayment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CardPayment" (id, "transactionId", "cardTokenId", "cardBrand", "lastFour", "expiryMonth", "expiryYear", "cardHolderName", bin, "gatewayResponse", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CardToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CardToken" (id, "merchantId", "customerId", token, provider, "cardBrand", "lastFour", "expiryMonth", "expiryYear", "cardHolderName", "isDefault", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CashDrawer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CashDrawer" (id, "terminalId", status, "openCount", "lastOpenAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (id, "merchantId", name, description, "parentId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Chargeback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Chargeback" (id, "transactionId", "merchantId", amount, currency, status, reason, "chargebackCode", "reasonCode", "initiatedAt", "resolvedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ChargebackEvidence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ChargebackEvidence" (id, "chargebackId", type, "fileUrl", description, "uploadedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ClockIn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClockIn" (id, "employeeId", "clockInTime", location, "deviceId", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: ClockOut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClockOut" (id, "employeeId", "clockOutTime", location, "deviceId", "totalHours", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: ColdWalletTransfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ColdWalletTransfer" (id, "walletTransferId", "coldWalletAddress", amount, currency, status, "signedTransaction", "broadcastTxHash", confirmations, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Commission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Commission" (id, "employeeId", "transactionId", amount, currency, rate, description, paid, "paidAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ComplianceLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ComplianceLog" (id, "merchantId", action, details, "performedBy", "ipAddress", "userAgent", "createdAt") FROM stdin;
\.


--
-- Data for Name: ComplianceReview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ComplianceReview" (id, "merchantId", "reviewType", status, findings, recommendations, "reviewerId", "reviewedAt", "dueDate", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CryptoAsset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CryptoAsset" (id, symbol, name, type, "blockchainId", "contractAddress", decimals, "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CryptoConversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CryptoConversion" (id, "merchantId", "fromCurrency", "toCurrency", "fromAmount", "toAmount", rate, fee, status, "exchangeProvider", "exchangeOrderId", "transactionId", "walletTransferId", metadata, "completedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CryptoQuote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CryptoQuote" (id, "fromCurrency", "toCurrency", amount, "quoteAmount", rate, "expiresAt", provider, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CryptoRate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CryptoRate" (id, "baseCurrency", "quoteCurrency", rate, source, "timestamp", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customer" (id, "merchantId", email, phone, "firstName", "lastName", "displayName", avatar, "addressLine1", "addressLine2", city, state, "postalCode", country, language, currency, status, notes, metadata, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: CustomerActivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerActivity" (id, "customerId", "activityType", description, "ipAddress", "userAgent", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: CustomerAddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerAddress" (id, "customerId", "addressLine1", "addressLine2", city, state, "postalCode", country, "isDefault", type, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CustomerCard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerCard" (id, "customerId", token, "cardBrand", "lastFour", "expiryMonth", "expiryYear", "cardHolderName", "isDefault", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CustomerDevice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerDevice" (id, "customerId", "deviceId", "deviceName", "deviceType", os, browser, "ipAddress", "lastSeenAt", "isTrusted", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CustomerLoyalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerLoyalty" (id, "customerId", "loyaltyLevel", "pointsBalance", "lifetimePoints", "totalSpent", "totalTransactions", "lastTransactionAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CustomerNotification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerNotification" (id, "customerId", type, subject, message, "sentAt", "readAt", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: CustomerReward; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerReward" (id, "customerId", points, "totalEarned", "totalRedeemed", tier, "expiryDate", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: CustomerWallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CustomerWallet" (id, "customerId", address, "blockchainId", currency, "isPrimary", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: DashboardWidget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DashboardWidget" (id, "merchantId", name, type, config, "position", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Department" (id, "merchantId", name, description, "managerId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Device" (id, "terminalId", name, type, model, "serialNumber", status, "ipAddress", port, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Dispute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dispute" (id, "transactionId", "merchantId", amount, currency, status, type, reason, "initiatedAt", "resolvedAt", metadata, "chargebackId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: DisputeEvidence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DisputeEvidence" (id, "disputeId", type, "fileUrl", description, "uploadedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: EmailVerification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EmailVerification" (id, token, "userId", "expiresAt", "verifiedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employee" (id, "merchantId", "userId", "firstName", "lastName", email, phone, role, "departmentId", "hireDate", "terminationDate", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ExchangeOrder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeOrder" (id, "exchangeProviderId", "merchantId", "orderId", symbol, side, type, price, amount, "filledAmount", "avgPrice", status, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ExchangeProvider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeProvider" (id, name, "isActive", "apiKey", "apiSecret", "baseUrl", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ExchangeQuote; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeQuote" (id, "exchangeProviderId", "fromCurrency", "toCurrency", "fromAmount", "toAmount", rate, "expiresAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ExchangeRate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeRate" (id, "fromCurrency", "toCurrency", rate, source, "timestamp", "expiresAt", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: ExchangeRateHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeRateHistory" (id, "fromCurrency", "toCurrency", rate, source, "timestamp", "createdAt") FROM stdin;
\.


--
-- Data for Name: ExchangeTrade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ExchangeTrade" (id, "orderId", "tradeId", price, amount, total, fee, "feeCurrency", "timestamp", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: GasHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GasHistory" (id, "networkId", price, "timestamp", "createdAt") FROM stdin;
\.


--
-- Data for Name: GasPrice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GasPrice" (id, "networkId", price, currency, "timestamp", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: GatewayLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GatewayLog" (id, "merchantId", provider, endpoint, method, "requestPayload", "responsePayload", "statusCode", error, "responseTime", "ipAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: GatewayRequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GatewayRequest" (id, "transactionId", "providerId", endpoint, method, "requestBody", "requestHeaders", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: GatewayResponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GatewayResponse" (id, "gatewayRequestId", "statusCode", "responseBody", "responseHeaders", error, "responseTime", "createdAt") FROM stdin;
\.


--
-- Data for Name: HotWalletTransfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HotWalletTransfer" (id, "walletTransferId", "hotWalletAddress", amount, currency, status, "signedTransaction", "broadcastTxHash", confirmations, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: IdentityVerification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IdentityVerification" (id, "kycId", "identityNumber", "documentType", "documentNumber", "documentCountry", "documentExpiry", "verificationResult", "verificationData", metadata, "verifiedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (id, "merchantId", "productId", quantity, "reservedQuantity", "availableQuantity", "lowStockThreshold", location, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: InventoryAdjustment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InventoryAdjustment" (id, "inventoryId", "productId", quantity, reason, "approvedBy", note, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: InventoryMovement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."InventoryMovement" (id, "inventoryId", "productId", quantity, type, reference, note, "beforeQuantity", "afterQuantity", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: Kyc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Kyc" (id, "merchantId", status, type, "firstName", "lastName", dob, nationality, address, city, state, "postalCode", country, "taxId", "registrationNumber", "businessName", "businessType", "businessAddress", "riskLevel", "amlStatus", "pepCheck", "sanctionsCheck", "reviewNotes", "submittedAt", "approvedAt", "rejectedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: KycDocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KycDocument" (id, "kycId", type, name, "fileUrl", "verificationStatus", "rejectionReason", "uploadedAt", "verifiedAt", "expiresAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: KycReview; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."KycReview" (id, "kycId", "reviewedBy", status, notes, decision, metadata, "reviewedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: LiquidityPool; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LiquidityPool" (id, "merchantId", name, "assetCurrency", "totalAmount", "reservedAmount", "availableAmount", "minBalance", "maxBalance", status, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: LoginHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."LoginHistory" (id, "userId", "ipAddress", "userAgent", location, success, "failureReason", "deviceId", "createdAt") FROM stdin;
\.


--
-- Data for Name: Merchant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Merchant" (id, name, "legalName", "businessType", "registrationNumber", "taxId", email, phone, website, timezone, currency, status, description, logo, "contactEmail", "contactPhone", "addressLine1", "addressLine2", city, state, "postalCode", country, "isVerified", "deletedAt", "createdAt", "updatedAt") FROM stdin;
cms766aj900014hs9svh1zomw	Demo Merchant	\N	Retail	\N	\N	merchant@smartpos.com	+2348000000000	\N	UTC	USD	ACTIVE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-07-30 07:05:50.038	2026-07-30 07:05:50.038
\.


--
-- Data for Name: MerchantAddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantAddress" (id, "merchantId", type, "addressLine1", "addressLine2", city, state, "postalCode", country, "isDefault", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantBranding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantBranding" (id, "merchantId", "companyName", logo, favicon, "primaryColor", "secondaryColor", font, "emailFooter", "receiptHeader", "receiptFooter", "invoiceLogo", website, "socialLinks", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantBusinessHours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantBusinessHours" (id, "merchantId", "dayOfWeek", "openTime", "closeTime", "isClosed", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantCompliance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantCompliance" (id, "merchantId", "riskLevel", "amlStatus", "kycStatus", "lastReviewDate", "nextReviewDate", "pepCheck", "sanctionsCheck", "restrictedCountries", notes, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantContact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantContact" (id, "merchantId", "firstName", "lastName", email, phone, role, "isPrimary", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantDocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantDocument" (id, "merchantId", type, name, "fileUrl", "verificationStatus", "rejectionReason", "uploadedAt", "verifiedAt", "expiresAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantFeature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantFeature" (id, "merchantId", "featureName", enabled, config, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantFee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantFee" (id, "merchantId", name, type, amount, rate, currency, "appliesTo", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantLimits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantLimits" (id, "merchantId", "dailyTransactionLimit", "weeklyTransactionLimit", "monthlyTransactionLimit", "dailyTransactionCount", "weeklyTransactionCount", "monthlyTransactionCount", "perTransactionMax", "perTransactionMin", "settlementLimit", "cryptoConversionLimit", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantNotificationSettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantNotificationSettings" (id, "merchantId", "emailNotifications", "smsNotifications", "pushNotifications", "webhookNotifications", "transactionEmails", "settlementEmails", "securityEmails", "promotionalEmails", "complianceEmails", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantSecuritySettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantSecuritySettings" (id, "merchantId", "mfaRequired", "passwordPolicy", "sessionTimeout", "ipWhitelistEnabled", "ipWhitelist", "webhookSecret", "apiKeyRotationDays", "auditLogRetentionDays", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantSettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantSettings" (id, "merchantId", "receiptFooter", "receiptLogo", "autoSettlement", "settlementThreshold", "defaultCurrency", timezone, language, "ipWhitelist", "maxTransactionAmount", "minTransactionAmount", "allowRefunds", "allowChargebacks", "allowPartialSettlement", "settlementAccountId", "defaultGatewayProviderId", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantSubscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantSubscription" (id, "merchantId", plan, status, "startDate", "expiryDate", "trialEndsAt", "autoRenew", amount, currency, "paymentMethod", "lastPaymentDate", "nextPaymentDate", "featureLimits", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: MerchantWebhookSettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MerchantWebhookSettings" (id, "merchantId", url, secret, events, enabled, "retryCount", "retryDelay", timeout, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notification" (id, "merchantId", "userId", "customerId", type, channel, title, message, data, "readAt", "deliveredAt", "sentAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: NotificationLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NotificationLog" (id, "notificationId", channel, status, error, "sentAt", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: OAuthAccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OAuthAccount" (id, "userId", provider, "providerId", email, "accessToken", "refreshToken", "expiresAt", "tokenType", scope, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PEPCheck; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PEPCheck" (id, "kycId", name, matched, "position", country, reference, metadata, "checkedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: PasswordReset; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PasswordReset" (id, token, "userId", "expiresAt", "usedAt", used, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PaymentAttempt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentAttempt" (id, "paymentIntentId", "transactionId", amount, currency, status, "gatewayResponse", "errorMessage", "attemptedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PaymentIntent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentIntent" (id, "merchantId", "customerId", "paymentMethodId", amount, currency, status, description, "clientSecret", metadata, "createdAt", "updatedAt", "expiresAt") FROM stdin;
cms766ajh00054hs93jjdqkyi	cms766aj900014hs9svh1zomw	\N	\N	2500.0000	USD	PENDING	Demo payment intent	pi_demo_secret	\N	2026-07-30 07:05:50.046	2026-07-30 07:05:50.046	\N
\.


--
-- Data for Name: PaymentMethod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentMethod" (id, "merchantId", "customerId", type, provider, token, "lastFour", "expiryMonth", "expiryYear", "isDefault", "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PaymentProvider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PaymentProvider" (id, name, "displayName", "isActive", "configSchema", "baseUrl", priority, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Payroll; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payroll" (id, "merchantId", "employeeId", "periodStart", "periodEnd", "basePay", "overtimePay", "bonusPay", deductions, "netPay", currency, status, "paidAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Permission" (id, name, description, resource, action, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Printer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Printer" (id, "terminalId", type, "paperSize", "characterSet", "autoCut", "lineSpacing", "printSpeed", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, "merchantId", name, description, sku, barcode, price, cost, currency, "categoryId", "brandId", weight, dimensions, "isTaxable", "taxRate", "isActive", metadata, "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: ProviderMetric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProviderMetric" (id, provider, requests, successes, failures, "averageResponseTime", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ProviderResponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProviderResponse" (id, "providerId", "requestId", "statusCode", body, headers, error, "createdAt") FROM stdin;
\.


--
-- Data for Name: Purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Purchase" (id, "merchantId", "supplierId", reference, "purchaseDate", "totalAmount", currency, status, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: PurchaseItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PurchaseItem" (id, "purchaseId", "productId", quantity, "unitPrice", "totalPrice", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ReceiptTemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ReceiptTemplate" (id, "merchantId", name, content, "isDefault", type, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RefreshToken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RefreshToken" (id, token, "userId", "expiresAt", revoked, "replacedBy", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Refund" (id, "transactionId", "merchantId", amount, currency, status, reason, "refundReference", "gatewayRefundId", "processedAt", metadata, "refundReasonId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RefundReason; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RefundReason" (id, "merchantId", reason, description, "isActive", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Report" (id, "merchantId", type, name, parameters, data, "fileUrl", format, status, "generatedAt", "completedAt", "expiresAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: ReportExport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ReportExport" (id, "reportId", format, "fileUrl", "fileSize", "generatedAt", "expiresAt", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: Reversal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Reversal" (id, "transactionId", amount, currency, reason, status, "reversedAt", "gatewayResponse", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RiskAssessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RiskAssessment" (id, "kycId", score, level, factors, "recommendedAction", metadata, "assessedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Role" (id, name, description, "isSystem", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RolePermission" (id, "roleId", "permissionId", "createdAt") FROM stdin;
\.


--
-- Data for Name: Salary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Salary" (id, "employeeId", "baseSalary", currency, "payFrequency", "effectiveDate", "endDate", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SanctionCheck; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SanctionCheck" (id, "kycId", name, alias, matched, "riskScore", "listName", reference, metadata, "checkedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: Scanner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Scanner" (id, "terminalId", type, model, resolution, "scanningMode", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Session" (id, "sessionId", "userId", "ipAddress", "userAgent", "deviceInfo", "isActive", "expiresAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Settlement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Settlement" (id, "merchantId", "batchId", "walletId", "bankAccountId", amount, currency, fee, "netAmount", status, "requestedAt", "processedAt", "completedAt", reference, metadata, "attemptCount", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SettlementAttempt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettlementAttempt" (id, "settlementId", "attemptNumber", status, "errorMessage", response, "startedAt", "completedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SettlementBatch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettlementBatch" (id, "merchantId", "batchReference", "totalAmount", currency, "totalFees", "totalNet", "transactionCount", status, "processedAt", "completedAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SettlementFee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettlementFee" (id, "settlementId", name, amount, currency, type, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SettlementRule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettlementRule" (id, "merchantId", name, condition, action, priority, "isActive", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SettlementSchedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SettlementSchedule" (id, "merchantId", frequency, "dayOfWeek", "dayOfMonth", "timeOfDay", "minAmount", "maxAmount", "isActive", "lastRunAt", "nextRunAt", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Shift; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Shift" (id, "employeeId", "startTime", "endTime", "breakDuration", "totalHours", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Supplier" (id, "merchantId", name, email, phone, address, "contactPerson", "taxId", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SystemConfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SystemConfiguration" (id, key, value, type, description, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: SystemSetting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SystemSetting" (id, "merchantId", key, value, type, description, "isGlobal", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Terminal" (id, "merchantId", "serialNumber", model, manufacturer, "firmwareVersion", "softwareVersion", status, location, "ipAddress", "macAddress", "lastHeartbeatAt", "lastBootAt", "lastTransactionAt", "batteryLevel", "storageUsed", "memoryUsed", "terminalGroupId", "isActive", "deletedAt", "createdAt", "updatedAt") FROM stdin;
cms766ajd00034hs9ilst11lu	cms766aj900014hs9svh1zomw	TERM-1001	PAX A920	PAX	\N	\N	ONLINE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	2026-07-30 07:05:50.041	2026-07-30 07:05:50.041
\.


--
-- Data for Name: TerminalConfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalConfiguration" (id, "terminalId", "receiptHeader", "receiptFooter", currency, timezone, language, "printerEnabled", "autoPrint", "signatureRequired", "tipsEnabled", "tipPercentages", "cashbackEnabled", "cashbackLimit", "offlineMode", "maxOfflineTransactions", "settlementSchedule", "gatewayOverride", theme, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TerminalGroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalGroup" (id, name, "merchantId", description, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TerminalHeartbeat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalHeartbeat" (id, "terminalId", status, uptime, battery, "memoryUsage", "cpuUsage", "storageFree", "networkStatus", "ipAddress", geolocation, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: TerminalKey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalKey" (id, "terminalId", "keyType", "keyHash", label, "expiresAt", "lastUsedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TerminalLocation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalLocation" (id, "terminalId", "storeName", address, latitude, longitude, city, state, country, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TerminalLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalLog" (id, "terminalId", level, message, "stackTrace", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: TerminalSoftware; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TerminalSoftware" (id, "terminalId", version, "releaseNotes", "installedAt", status, checksum, "fileUrl", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transaction" (id, "merchantId", "terminalId", "customerId", "walletId", amount, currency, status, type, reference, description, "gatewayTransactionId", "gatewayProvider", "approvalCode", "paymentMethod", "cardBrand", "cardLastFour", "cardExpiry", "authCode", "customerIP", "customerUserAgent", metadata, "feeAmount", "feeCurrency", "netAmount", "settlementStatus", "settlementAmount", "settlementCurrency", "settlementDate", "cryptoConversionId", "cryptoAmount", "cryptoCurrency", "blockchainTransactionId", "paymentIntentId", "createdAt", "updatedAt", "deletedAt") FROM stdin;
cms766ajn00074hs9ozd4yn10	cms766aj900014hs9svh1zomw	cms766ajd00034hs9ilst11lu	\N	\N	2500.0000	USD	SETTLED	PURCHASE	TX-DEMO-001	Demo POS payment	\N	\N	\N	CARD	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	PENDING	\N	\N	\N	\N	\N	\N	\N	cms766ajh00054hs93jjdqkyi	2026-07-30 07:05:50.051	2026-07-30 07:05:50.051	\N
\.


--
-- Data for Name: TransactionDiscount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionDiscount" (id, "transactionId", name, amount, currency, type, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TransactionEvent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionEvent" (id, "transactionId", "eventType", status, description, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: TransactionFee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionFee" (id, "transactionId", "walletId", name, amount, currency, type, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TransactionItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionItem" (id, "transactionId", "productId", sku, name, description, quantity, "unitPrice", "totalPrice", "discountAmount", "taxAmount", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TransactionMetadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionMetadata" (id, "transactionId", key, value, "createdAt") FROM stdin;
\.


--
-- Data for Name: TransactionStatusHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionStatusHistory" (id, "transactionId", "oldStatus", "newStatus", "changedBy", reason, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: TransactionTax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionTax" (id, "transactionId", name, rate, amount, currency, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: TransactionTimeline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TransactionTimeline" (id, "transactionId", step, status, message, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, phone, "passwordHash", "firstName", "lastName", "displayName", avatar, role, status, "lastLoginAt", "lastLoginIP", "isActive", "isVerified", "isMFAEnabled", "mfaSecret", "backupCodes", "passwordResetToken", "passwordResetExpires", "emailVerifyToken", "emailVerifyExpires", "deletedAt", "merchantId", "assignedRoleId", "createdAt", "updatedAt") FROM stdin;
cms766aj400004hs99mkfjwv4	admin@smartpos.com	\N	$2b$10$bdTusYdjVjpHX4nxu6EujOomF9gbiaAUdi/SlAnRKqDeKcQw6SW2a	Admin	User	SmartPOS Admin	\N	SUPER_ADMIN	ACTIVE	\N	\N	t	t	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-07-30 07:05:50.032	2026-07-30 07:05:50.032
\.


--
-- Data for Name: UserPermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserPermission" (id, "userId", "permissionId", "grantedBy", "grantedAt", "revokedAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: VoidTransaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."VoidTransaction" (id, "transactionId", reason, status, "voidedAt", "gatewayResponse", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wallet" (id, "merchantId", name, type, currency, balance, "reservedBalance", "availableBalance", status, address, "blockchainId", "encryptedPrivateKey", "publicKey", "bankAccountId", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: WalletAddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WalletAddress" (id, "walletId", address, "blockchainId", "isActive", label, metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: WalletAudit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WalletAudit" (id, "walletId", action, amount, "balanceBefore", "balanceAfter", reference, metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: WalletBalance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WalletBalance" (id, "walletId", "assetType", balance, reserved, available, "snapshotAt", metadata, "createdAt") FROM stdin;
\.


--
-- Data for Name: WalletKey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WalletKey" (id, "walletId", "keyType", "encryptedKey", "keyHash", label, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: WalletTransfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WalletTransfer" (id, "merchantId", "fromWalletId", "toWalletId", amount, currency, fee, status, type, reference, "blockchainTxId", metadata, "completedAt", "cryptoConversionId", "refundId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Webhook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Webhook" (id, "merchantId", url, secret, events, "isActive", "retryCount", "retryDelay", timeout, "lastDeliveryAt", "lastSuccessAt", "lastFailureAt", "failureCount", metadata, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: WebhookDelivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WebhookDelivery" (id, "webhookId", event, payload, status, "responseStatus", "responseBody", error, attempts, "deliveredAt", "nextRetryAt", "transactionId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: WebhookEvent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WebhookEvent" (id, "merchantId", "eventName", "eventData", delivered, "deliveredAt", error, "createdAt") FROM stdin;
\.


--
-- Data for Name: WebhookRetry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WebhookRetry" (id, "webhookDeliveryId", "attemptNumber", "scheduledAt", "executedAt", status, "responseStatus", error, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: AMLCheck AMLCheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AMLCheck"
    ADD CONSTRAINT "AMLCheck_pkey" PRIMARY KEY (id);


--
-- Name: ActivityLog ActivityLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActivityLog"
    ADD CONSTRAINT "ActivityLog_pkey" PRIMARY KEY (id);


--
-- Name: AddressVerification AddressVerification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AddressVerification"
    ADD CONSTRAINT "AddressVerification_pkey" PRIMARY KEY (id);


--
-- Name: ApiKeyUsage ApiKeyUsage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiKeyUsage"
    ADD CONSTRAINT "ApiKeyUsage_pkey" PRIMARY KEY (id);


--
-- Name: ApiKey ApiKey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiKey"
    ADD CONSTRAINT "ApiKey_pkey" PRIMARY KEY (id);


--
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY (id);


--
-- Name: AuditLog AuditLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_pkey" PRIMARY KEY (id);


--
-- Name: Authorization Authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Authorization"
    ADD CONSTRAINT "Authorization_pkey" PRIMARY KEY (id);


--
-- Name: BackupHistory BackupHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BackupHistory"
    ADD CONSTRAINT "BackupHistory_pkey" PRIMARY KEY (id);


--
-- Name: Backup Backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Backup"
    ADD CONSTRAINT "Backup_pkey" PRIMARY KEY (id);


--
-- Name: BankAccount BankAccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankAccount"
    ADD CONSTRAINT "BankAccount_pkey" PRIMARY KEY (id);


--
-- Name: BlockchainConfirmation BlockchainConfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainConfirmation"
    ADD CONSTRAINT "BlockchainConfirmation_pkey" PRIMARY KEY (id);


--
-- Name: BlockchainExplorer BlockchainExplorer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainExplorer"
    ADD CONSTRAINT "BlockchainExplorer_pkey" PRIMARY KEY (id);


--
-- Name: BlockchainFee BlockchainFee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainFee"
    ADD CONSTRAINT "BlockchainFee_pkey" PRIMARY KEY (id);


--
-- Name: BlockchainNetwork BlockchainNetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainNetwork"
    ADD CONSTRAINT "BlockchainNetwork_pkey" PRIMARY KEY (id);


--
-- Name: BlockchainTransaction BlockchainTransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainTransaction"
    ADD CONSTRAINT "BlockchainTransaction_pkey" PRIMARY KEY (id);


--
-- Name: Brand Brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (id);


--
-- Name: Capture Capture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Capture"
    ADD CONSTRAINT "Capture_pkey" PRIMARY KEY (id);


--
-- Name: CardBIN CardBIN_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardBIN"
    ADD CONSTRAINT "CardBIN_pkey" PRIMARY KEY (id);


--
-- Name: CardPayment CardPayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardPayment"
    ADD CONSTRAINT "CardPayment_pkey" PRIMARY KEY (id);


--
-- Name: CardToken CardToken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardToken"
    ADD CONSTRAINT "CardToken_pkey" PRIMARY KEY (id);


--
-- Name: CashDrawer CashDrawer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CashDrawer"
    ADD CONSTRAINT "CashDrawer_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: ChargebackEvidence ChargebackEvidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ChargebackEvidence"
    ADD CONSTRAINT "ChargebackEvidence_pkey" PRIMARY KEY (id);


--
-- Name: Chargeback Chargeback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chargeback"
    ADD CONSTRAINT "Chargeback_pkey" PRIMARY KEY (id);


--
-- Name: ClockIn ClockIn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClockIn"
    ADD CONSTRAINT "ClockIn_pkey" PRIMARY KEY (id);


--
-- Name: ClockOut ClockOut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClockOut"
    ADD CONSTRAINT "ClockOut_pkey" PRIMARY KEY (id);


--
-- Name: ColdWalletTransfer ColdWalletTransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ColdWalletTransfer"
    ADD CONSTRAINT "ColdWalletTransfer_pkey" PRIMARY KEY (id);


--
-- Name: Commission Commission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Commission"
    ADD CONSTRAINT "Commission_pkey" PRIMARY KEY (id);


--
-- Name: ComplianceLog ComplianceLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComplianceLog"
    ADD CONSTRAINT "ComplianceLog_pkey" PRIMARY KEY (id);


--
-- Name: ComplianceReview ComplianceReview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComplianceReview"
    ADD CONSTRAINT "ComplianceReview_pkey" PRIMARY KEY (id);


--
-- Name: CryptoAsset CryptoAsset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoAsset"
    ADD CONSTRAINT "CryptoAsset_pkey" PRIMARY KEY (id);


--
-- Name: CryptoConversion CryptoConversion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoConversion"
    ADD CONSTRAINT "CryptoConversion_pkey" PRIMARY KEY (id);


--
-- Name: CryptoQuote CryptoQuote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoQuote"
    ADD CONSTRAINT "CryptoQuote_pkey" PRIMARY KEY (id);


--
-- Name: CryptoRate CryptoRate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoRate"
    ADD CONSTRAINT "CryptoRate_pkey" PRIMARY KEY (id);


--
-- Name: CustomerActivity CustomerActivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerActivity"
    ADD CONSTRAINT "CustomerActivity_pkey" PRIMARY KEY (id);


--
-- Name: CustomerAddress CustomerAddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerAddress"
    ADD CONSTRAINT "CustomerAddress_pkey" PRIMARY KEY (id);


--
-- Name: CustomerCard CustomerCard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerCard"
    ADD CONSTRAINT "CustomerCard_pkey" PRIMARY KEY (id);


--
-- Name: CustomerDevice CustomerDevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerDevice"
    ADD CONSTRAINT "CustomerDevice_pkey" PRIMARY KEY (id);


--
-- Name: CustomerLoyalty CustomerLoyalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerLoyalty"
    ADD CONSTRAINT "CustomerLoyalty_pkey" PRIMARY KEY (id);


--
-- Name: CustomerNotification CustomerNotification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerNotification"
    ADD CONSTRAINT "CustomerNotification_pkey" PRIMARY KEY (id);


--
-- Name: CustomerReward CustomerReward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerReward"
    ADD CONSTRAINT "CustomerReward_pkey" PRIMARY KEY (id);


--
-- Name: CustomerWallet CustomerWallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerWallet"
    ADD CONSTRAINT "CustomerWallet_pkey" PRIMARY KEY (id);


--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- Name: DashboardWidget DashboardWidget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DashboardWidget"
    ADD CONSTRAINT "DashboardWidget_pkey" PRIMARY KEY (id);


--
-- Name: Department Department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (id);


--
-- Name: Device Device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "Device_pkey" PRIMARY KEY (id);


--
-- Name: DisputeEvidence DisputeEvidence_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisputeEvidence"
    ADD CONSTRAINT "DisputeEvidence_pkey" PRIMARY KEY (id);


--
-- Name: Dispute Dispute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispute"
    ADD CONSTRAINT "Dispute_pkey" PRIMARY KEY (id);


--
-- Name: EmailVerification EmailVerification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailVerification"
    ADD CONSTRAINT "EmailVerification_pkey" PRIMARY KEY (id);


--
-- Name: Employee Employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeOrder ExchangeOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeOrder"
    ADD CONSTRAINT "ExchangeOrder_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeProvider ExchangeProvider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeProvider"
    ADD CONSTRAINT "ExchangeProvider_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeQuote ExchangeQuote_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeQuote"
    ADD CONSTRAINT "ExchangeQuote_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeRateHistory ExchangeRateHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeRateHistory"
    ADD CONSTRAINT "ExchangeRateHistory_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeRate ExchangeRate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeRate"
    ADD CONSTRAINT "ExchangeRate_pkey" PRIMARY KEY (id);


--
-- Name: ExchangeTrade ExchangeTrade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeTrade"
    ADD CONSTRAINT "ExchangeTrade_pkey" PRIMARY KEY (id);


--
-- Name: GasHistory GasHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasHistory"
    ADD CONSTRAINT "GasHistory_pkey" PRIMARY KEY (id);


--
-- Name: GasPrice GasPrice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasPrice"
    ADD CONSTRAINT "GasPrice_pkey" PRIMARY KEY (id);


--
-- Name: GatewayLog GatewayLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayLog"
    ADD CONSTRAINT "GatewayLog_pkey" PRIMARY KEY (id);


--
-- Name: GatewayRequest GatewayRequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayRequest"
    ADD CONSTRAINT "GatewayRequest_pkey" PRIMARY KEY (id);


--
-- Name: GatewayResponse GatewayResponse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayResponse"
    ADD CONSTRAINT "GatewayResponse_pkey" PRIMARY KEY (id);


--
-- Name: HotWalletTransfer HotWalletTransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HotWalletTransfer"
    ADD CONSTRAINT "HotWalletTransfer_pkey" PRIMARY KEY (id);


--
-- Name: IdentityVerification IdentityVerification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityVerification"
    ADD CONSTRAINT "IdentityVerification_pkey" PRIMARY KEY (id);


--
-- Name: InventoryAdjustment InventoryAdjustment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryAdjustment"
    ADD CONSTRAINT "InventoryAdjustment_pkey" PRIMARY KEY (id);


--
-- Name: InventoryMovement InventoryMovement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryMovement"
    ADD CONSTRAINT "InventoryMovement_pkey" PRIMARY KEY (id);


--
-- Name: Inventory Inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (id);


--
-- Name: KycDocument KycDocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KycDocument"
    ADD CONSTRAINT "KycDocument_pkey" PRIMARY KEY (id);


--
-- Name: KycReview KycReview_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KycReview"
    ADD CONSTRAINT "KycReview_pkey" PRIMARY KEY (id);


--
-- Name: Kyc Kyc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kyc"
    ADD CONSTRAINT "Kyc_pkey" PRIMARY KEY (id);


--
-- Name: LiquidityPool LiquidityPool_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LiquidityPool"
    ADD CONSTRAINT "LiquidityPool_pkey" PRIMARY KEY (id);


--
-- Name: LoginHistory LoginHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LoginHistory"
    ADD CONSTRAINT "LoginHistory_pkey" PRIMARY KEY (id);


--
-- Name: MerchantAddress MerchantAddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantAddress"
    ADD CONSTRAINT "MerchantAddress_pkey" PRIMARY KEY (id);


--
-- Name: MerchantBranding MerchantBranding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantBranding"
    ADD CONSTRAINT "MerchantBranding_pkey" PRIMARY KEY (id);


--
-- Name: MerchantBusinessHours MerchantBusinessHours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantBusinessHours"
    ADD CONSTRAINT "MerchantBusinessHours_pkey" PRIMARY KEY (id);


--
-- Name: MerchantCompliance MerchantCompliance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantCompliance"
    ADD CONSTRAINT "MerchantCompliance_pkey" PRIMARY KEY (id);


--
-- Name: MerchantContact MerchantContact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantContact"
    ADD CONSTRAINT "MerchantContact_pkey" PRIMARY KEY (id);


--
-- Name: MerchantDocument MerchantDocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantDocument"
    ADD CONSTRAINT "MerchantDocument_pkey" PRIMARY KEY (id);


--
-- Name: MerchantFeature MerchantFeature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantFeature"
    ADD CONSTRAINT "MerchantFeature_pkey" PRIMARY KEY (id);


--
-- Name: MerchantFee MerchantFee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantFee"
    ADD CONSTRAINT "MerchantFee_pkey" PRIMARY KEY (id);


--
-- Name: MerchantLimits MerchantLimits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantLimits"
    ADD CONSTRAINT "MerchantLimits_pkey" PRIMARY KEY (id);


--
-- Name: MerchantNotificationSettings MerchantNotificationSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantNotificationSettings"
    ADD CONSTRAINT "MerchantNotificationSettings_pkey" PRIMARY KEY (id);


--
-- Name: MerchantSecuritySettings MerchantSecuritySettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSecuritySettings"
    ADD CONSTRAINT "MerchantSecuritySettings_pkey" PRIMARY KEY (id);


--
-- Name: MerchantSettings MerchantSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSettings"
    ADD CONSTRAINT "MerchantSettings_pkey" PRIMARY KEY (id);


--
-- Name: MerchantSubscription MerchantSubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSubscription"
    ADD CONSTRAINT "MerchantSubscription_pkey" PRIMARY KEY (id);


--
-- Name: MerchantWebhookSettings MerchantWebhookSettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantWebhookSettings"
    ADD CONSTRAINT "MerchantWebhookSettings_pkey" PRIMARY KEY (id);


--
-- Name: Merchant Merchant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Merchant"
    ADD CONSTRAINT "Merchant_pkey" PRIMARY KEY (id);


--
-- Name: NotificationLog NotificationLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationLog"
    ADD CONSTRAINT "NotificationLog_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: OAuthAccount OAuthAccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OAuthAccount"
    ADD CONSTRAINT "OAuthAccount_pkey" PRIMARY KEY (id);


--
-- Name: PEPCheck PEPCheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PEPCheck"
    ADD CONSTRAINT "PEPCheck_pkey" PRIMARY KEY (id);


--
-- Name: PasswordReset PasswordReset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PasswordReset"
    ADD CONSTRAINT "PasswordReset_pkey" PRIMARY KEY (id);


--
-- Name: PaymentAttempt PaymentAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentAttempt"
    ADD CONSTRAINT "PaymentAttempt_pkey" PRIMARY KEY (id);


--
-- Name: PaymentIntent PaymentIntent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentIntent"
    ADD CONSTRAINT "PaymentIntent_pkey" PRIMARY KEY (id);


--
-- Name: PaymentMethod PaymentMethod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethod"
    ADD CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY (id);


--
-- Name: PaymentProvider PaymentProvider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentProvider"
    ADD CONSTRAINT "PaymentProvider_pkey" PRIMARY KEY (id);


--
-- Name: Payroll Payroll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_pkey" PRIMARY KEY (id);


--
-- Name: Permission Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY (id);


--
-- Name: Printer Printer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Printer"
    ADD CONSTRAINT "Printer_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: ProviderMetric ProviderMetric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProviderMetric"
    ADD CONSTRAINT "ProviderMetric_pkey" PRIMARY KEY (id);


--
-- Name: ProviderResponse ProviderResponse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProviderResponse"
    ADD CONSTRAINT "ProviderResponse_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseItem PurchaseItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PurchaseItem"
    ADD CONSTRAINT "PurchaseItem_pkey" PRIMARY KEY (id);


--
-- Name: Purchase Purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purchase"
    ADD CONSTRAINT "Purchase_pkey" PRIMARY KEY (id);


--
-- Name: ReceiptTemplate ReceiptTemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceiptTemplate"
    ADD CONSTRAINT "ReceiptTemplate_pkey" PRIMARY KEY (id);


--
-- Name: RefreshToken RefreshToken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_pkey" PRIMARY KEY (id);


--
-- Name: RefundReason RefundReason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefundReason"
    ADD CONSTRAINT "RefundReason_pkey" PRIMARY KEY (id);


--
-- Name: Refund Refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Refund"
    ADD CONSTRAINT "Refund_pkey" PRIMARY KEY (id);


--
-- Name: ReportExport ReportExport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReportExport"
    ADD CONSTRAINT "ReportExport_pkey" PRIMARY KEY (id);


--
-- Name: Report Report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (id);


--
-- Name: Reversal Reversal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reversal"
    ADD CONSTRAINT "Reversal_pkey" PRIMARY KEY (id);


--
-- Name: RiskAssessment RiskAssessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiskAssessment"
    ADD CONSTRAINT "RiskAssessment_pkey" PRIMARY KEY (id);


--
-- Name: RolePermission RolePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY (id);


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: Salary Salary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Salary"
    ADD CONSTRAINT "Salary_pkey" PRIMARY KEY (id);


--
-- Name: SanctionCheck SanctionCheck_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SanctionCheck"
    ADD CONSTRAINT "SanctionCheck_pkey" PRIMARY KEY (id);


--
-- Name: Scanner Scanner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Scanner"
    ADD CONSTRAINT "Scanner_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: SettlementAttempt SettlementAttempt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementAttempt"
    ADD CONSTRAINT "SettlementAttempt_pkey" PRIMARY KEY (id);


--
-- Name: SettlementBatch SettlementBatch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementBatch"
    ADD CONSTRAINT "SettlementBatch_pkey" PRIMARY KEY (id);


--
-- Name: SettlementFee SettlementFee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementFee"
    ADD CONSTRAINT "SettlementFee_pkey" PRIMARY KEY (id);


--
-- Name: SettlementRule SettlementRule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementRule"
    ADD CONSTRAINT "SettlementRule_pkey" PRIMARY KEY (id);


--
-- Name: SettlementSchedule SettlementSchedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementSchedule"
    ADD CONSTRAINT "SettlementSchedule_pkey" PRIMARY KEY (id);


--
-- Name: Settlement Settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settlement"
    ADD CONSTRAINT "Settlement_pkey" PRIMARY KEY (id);


--
-- Name: Shift Shift_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_pkey" PRIMARY KEY (id);


--
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (id);


--
-- Name: SystemConfiguration SystemConfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SystemConfiguration"
    ADD CONSTRAINT "SystemConfiguration_pkey" PRIMARY KEY (id);


--
-- Name: SystemSetting SystemSetting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SystemSetting"
    ADD CONSTRAINT "SystemSetting_pkey" PRIMARY KEY (id);


--
-- Name: TerminalConfiguration TerminalConfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalConfiguration"
    ADD CONSTRAINT "TerminalConfiguration_pkey" PRIMARY KEY (id);


--
-- Name: TerminalGroup TerminalGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalGroup"
    ADD CONSTRAINT "TerminalGroup_pkey" PRIMARY KEY (id);


--
-- Name: TerminalHeartbeat TerminalHeartbeat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalHeartbeat"
    ADD CONSTRAINT "TerminalHeartbeat_pkey" PRIMARY KEY (id);


--
-- Name: TerminalKey TerminalKey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalKey"
    ADD CONSTRAINT "TerminalKey_pkey" PRIMARY KEY (id);


--
-- Name: TerminalLocation TerminalLocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalLocation"
    ADD CONSTRAINT "TerminalLocation_pkey" PRIMARY KEY (id);


--
-- Name: TerminalLog TerminalLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalLog"
    ADD CONSTRAINT "TerminalLog_pkey" PRIMARY KEY (id);


--
-- Name: TerminalSoftware TerminalSoftware_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalSoftware"
    ADD CONSTRAINT "TerminalSoftware_pkey" PRIMARY KEY (id);


--
-- Name: Terminal Terminal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terminal"
    ADD CONSTRAINT "Terminal_pkey" PRIMARY KEY (id);


--
-- Name: TransactionDiscount TransactionDiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionDiscount"
    ADD CONSTRAINT "TransactionDiscount_pkey" PRIMARY KEY (id);


--
-- Name: TransactionEvent TransactionEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionEvent"
    ADD CONSTRAINT "TransactionEvent_pkey" PRIMARY KEY (id);


--
-- Name: TransactionFee TransactionFee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionFee"
    ADD CONSTRAINT "TransactionFee_pkey" PRIMARY KEY (id);


--
-- Name: TransactionItem TransactionItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionItem"
    ADD CONSTRAINT "TransactionItem_pkey" PRIMARY KEY (id);


--
-- Name: TransactionMetadata TransactionMetadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionMetadata"
    ADD CONSTRAINT "TransactionMetadata_pkey" PRIMARY KEY (id);


--
-- Name: TransactionStatusHistory TransactionStatusHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionStatusHistory"
    ADD CONSTRAINT "TransactionStatusHistory_pkey" PRIMARY KEY (id);


--
-- Name: TransactionTax TransactionTax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionTax"
    ADD CONSTRAINT "TransactionTax_pkey" PRIMARY KEY (id);


--
-- Name: TransactionTimeline TransactionTimeline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionTimeline"
    ADD CONSTRAINT "TransactionTimeline_pkey" PRIMARY KEY (id);


--
-- Name: Transaction Transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY (id);


--
-- Name: UserPermission UserPermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: VoidTransaction VoidTransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VoidTransaction"
    ADD CONSTRAINT "VoidTransaction_pkey" PRIMARY KEY (id);


--
-- Name: WalletAddress WalletAddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletAddress"
    ADD CONSTRAINT "WalletAddress_pkey" PRIMARY KEY (id);


--
-- Name: WalletAudit WalletAudit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletAudit"
    ADD CONSTRAINT "WalletAudit_pkey" PRIMARY KEY (id);


--
-- Name: WalletBalance WalletBalance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletBalance"
    ADD CONSTRAINT "WalletBalance_pkey" PRIMARY KEY (id);


--
-- Name: WalletKey WalletKey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletKey"
    ADD CONSTRAINT "WalletKey_pkey" PRIMARY KEY (id);


--
-- Name: WalletTransfer WalletTransfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_pkey" PRIMARY KEY (id);


--
-- Name: Wallet Wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT "Wallet_pkey" PRIMARY KEY (id);


--
-- Name: WebhookDelivery WebhookDelivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookDelivery"
    ADD CONSTRAINT "WebhookDelivery_pkey" PRIMARY KEY (id);


--
-- Name: WebhookEvent WebhookEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookEvent"
    ADD CONSTRAINT "WebhookEvent_pkey" PRIMARY KEY (id);


--
-- Name: WebhookRetry WebhookRetry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookRetry"
    ADD CONSTRAINT "WebhookRetry_pkey" PRIMARY KEY (id);


--
-- Name: Webhook Webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Webhook"
    ADD CONSTRAINT "Webhook_pkey" PRIMARY KEY (id);


--
-- Name: AMLCheck_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AMLCheck_kycId_idx" ON public."AMLCheck" USING btree ("kycId");


--
-- Name: ActivityLog_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ActivityLog_createdAt_idx" ON public."ActivityLog" USING btree ("createdAt" DESC);


--
-- Name: ActivityLog_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ActivityLog_merchantId_idx" ON public."ActivityLog" USING btree ("merchantId");


--
-- Name: ActivityLog_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ActivityLog_userId_idx" ON public."ActivityLog" USING btree ("userId");


--
-- Name: AddressVerification_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AddressVerification_kycId_idx" ON public."AddressVerification" USING btree ("kycId");


--
-- Name: ApiKeyUsage_apiKeyId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKeyUsage_apiKeyId_idx" ON public."ApiKeyUsage" USING btree ("apiKeyId");


--
-- Name: ApiKeyUsage_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKeyUsage_createdAt_idx" ON public."ApiKeyUsage" USING btree ("createdAt" DESC);


--
-- Name: ApiKey_keyHash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKey_keyHash_idx" ON public."ApiKey" USING btree ("keyHash");


--
-- Name: ApiKey_keyHash_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ApiKey_keyHash_key" ON public."ApiKey" USING btree ("keyHash");


--
-- Name: ApiKey_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKey_merchantId_idx" ON public."ApiKey" USING btree ("merchantId");


--
-- Name: ApiKey_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKey_status_idx" ON public."ApiKey" USING btree (status);


--
-- Name: ApiKey_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ApiKey_userId_idx" ON public."ApiKey" USING btree ("userId");


--
-- Name: Attendance_date_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Attendance_date_idx" ON public."Attendance" USING btree (date);


--
-- Name: Attendance_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Attendance_employeeId_idx" ON public."Attendance" USING btree ("employeeId");


--
-- Name: AuditLog_action_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_action_idx" ON public."AuditLog" USING btree (action);


--
-- Name: AuditLog_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_createdAt_idx" ON public."AuditLog" USING btree ("createdAt" DESC);


--
-- Name: AuditLog_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_merchantId_idx" ON public."AuditLog" USING btree ("merchantId");


--
-- Name: AuditLog_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_transactionId_idx" ON public."AuditLog" USING btree ("transactionId");


--
-- Name: AuditLog_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuditLog_userId_idx" ON public."AuditLog" USING btree ("userId");


--
-- Name: Authorization_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Authorization_transactionId_idx" ON public."Authorization" USING btree ("transactionId");


--
-- Name: Authorization_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Authorization_transactionId_key" ON public."Authorization" USING btree ("transactionId");


--
-- Name: BackupHistory_backupId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BackupHistory_backupId_idx" ON public."BackupHistory" USING btree ("backupId");


--
-- Name: BackupHistory_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BackupHistory_createdAt_idx" ON public."BackupHistory" USING btree ("createdAt" DESC);


--
-- Name: BankAccount_merchantId_accountNumber_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BankAccount_merchantId_accountNumber_key" ON public."BankAccount" USING btree ("merchantId", "accountNumber");


--
-- Name: BankAccount_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BankAccount_merchantId_idx" ON public."BankAccount" USING btree ("merchantId");


--
-- Name: BlockchainConfirmation_confirmations_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainConfirmation_confirmations_idx" ON public."BlockchainConfirmation" USING btree (confirmations);


--
-- Name: BlockchainConfirmation_txId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainConfirmation_txId_idx" ON public."BlockchainConfirmation" USING btree ("txId");


--
-- Name: BlockchainExplorer_blockchainId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BlockchainExplorer_blockchainId_key" ON public."BlockchainExplorer" USING btree ("blockchainId");


--
-- Name: BlockchainFee_blockchainId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainFee_blockchainId_idx" ON public."BlockchainFee" USING btree ("blockchainId");


--
-- Name: BlockchainFee_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainFee_timestamp_idx" ON public."BlockchainFee" USING btree ("timestamp" DESC);


--
-- Name: BlockchainNetwork_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BlockchainNetwork_name_key" ON public."BlockchainNetwork" USING btree (name);


--
-- Name: BlockchainTransaction_blockchainId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_blockchainId_idx" ON public."BlockchainTransaction" USING btree ("blockchainId");


--
-- Name: BlockchainTransaction_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_createdAt_idx" ON public."BlockchainTransaction" USING btree ("createdAt" DESC);


--
-- Name: BlockchainTransaction_fromAddress_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_fromAddress_idx" ON public."BlockchainTransaction" USING btree ("fromAddress");


--
-- Name: BlockchainTransaction_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_status_idx" ON public."BlockchainTransaction" USING btree (status);


--
-- Name: BlockchainTransaction_toAddress_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_toAddress_idx" ON public."BlockchainTransaction" USING btree ("toAddress");


--
-- Name: BlockchainTransaction_txHash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_txHash_idx" ON public."BlockchainTransaction" USING btree ("txHash");


--
-- Name: BlockchainTransaction_txHash_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BlockchainTransaction_txHash_key" ON public."BlockchainTransaction" USING btree ("txHash");


--
-- Name: BlockchainTransaction_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BlockchainTransaction_walletId_idx" ON public."BlockchainTransaction" USING btree ("walletId");


--
-- Name: Brand_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Brand_merchantId_idx" ON public."Brand" USING btree ("merchantId");


--
-- Name: Brand_merchantId_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Brand_merchantId_name_key" ON public."Brand" USING btree ("merchantId", name);


--
-- Name: Capture_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Capture_transactionId_idx" ON public."Capture" USING btree ("transactionId");


--
-- Name: Capture_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Capture_transactionId_key" ON public."Capture" USING btree ("transactionId");


--
-- Name: CardBIN_bin_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardBIN_bin_idx" ON public."CardBIN" USING btree (bin);


--
-- Name: CardBIN_bin_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CardBIN_bin_key" ON public."CardBIN" USING btree (bin);


--
-- Name: CardPayment_bin_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardPayment_bin_idx" ON public."CardPayment" USING btree (bin);


--
-- Name: CardPayment_cardTokenId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardPayment_cardTokenId_idx" ON public."CardPayment" USING btree ("cardTokenId");


--
-- Name: CardPayment_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardPayment_transactionId_idx" ON public."CardPayment" USING btree ("transactionId");


--
-- Name: CardPayment_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CardPayment_transactionId_key" ON public."CardPayment" USING btree ("transactionId");


--
-- Name: CardToken_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardToken_customerId_idx" ON public."CardToken" USING btree ("customerId");


--
-- Name: CardToken_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardToken_merchantId_idx" ON public."CardToken" USING btree ("merchantId");


--
-- Name: CardToken_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CardToken_token_idx" ON public."CardToken" USING btree (token);


--
-- Name: CardToken_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CardToken_token_key" ON public."CardToken" USING btree (token);


--
-- Name: CashDrawer_terminalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CashDrawer_terminalId_key" ON public."CashDrawer" USING btree ("terminalId");


--
-- Name: Category_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Category_merchantId_idx" ON public."Category" USING btree ("merchantId");


--
-- Name: Category_merchantId_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Category_merchantId_name_key" ON public."Category" USING btree ("merchantId", name);


--
-- Name: Category_parentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Category_parentId_idx" ON public."Category" USING btree ("parentId");


--
-- Name: ChargebackEvidence_chargebackId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ChargebackEvidence_chargebackId_idx" ON public."ChargebackEvidence" USING btree ("chargebackId");


--
-- Name: Chargeback_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Chargeback_merchantId_idx" ON public."Chargeback" USING btree ("merchantId");


--
-- Name: Chargeback_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Chargeback_status_idx" ON public."Chargeback" USING btree (status);


--
-- Name: Chargeback_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Chargeback_transactionId_idx" ON public."Chargeback" USING btree ("transactionId");


--
-- Name: ClockIn_clockInTime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ClockIn_clockInTime_idx" ON public."ClockIn" USING btree ("clockInTime");


--
-- Name: ClockIn_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ClockIn_employeeId_idx" ON public."ClockIn" USING btree ("employeeId");


--
-- Name: ClockOut_clockOutTime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ClockOut_clockOutTime_idx" ON public."ClockOut" USING btree ("clockOutTime");


--
-- Name: ClockOut_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ClockOut_employeeId_idx" ON public."ClockOut" USING btree ("employeeId");


--
-- Name: ColdWalletTransfer_coldWalletAddress_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ColdWalletTransfer_coldWalletAddress_idx" ON public."ColdWalletTransfer" USING btree ("coldWalletAddress");


--
-- Name: ColdWalletTransfer_walletTransferId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ColdWalletTransfer_walletTransferId_idx" ON public."ColdWalletTransfer" USING btree ("walletTransferId");


--
-- Name: ColdWalletTransfer_walletTransferId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ColdWalletTransfer_walletTransferId_key" ON public."ColdWalletTransfer" USING btree ("walletTransferId");


--
-- Name: Commission_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Commission_employeeId_idx" ON public."Commission" USING btree ("employeeId");


--
-- Name: Commission_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Commission_transactionId_idx" ON public."Commission" USING btree ("transactionId");


--
-- Name: ComplianceLog_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ComplianceLog_createdAt_idx" ON public."ComplianceLog" USING btree ("createdAt" DESC);


--
-- Name: ComplianceLog_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ComplianceLog_merchantId_idx" ON public."ComplianceLog" USING btree ("merchantId");


--
-- Name: ComplianceReview_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ComplianceReview_merchantId_idx" ON public."ComplianceReview" USING btree ("merchantId");


--
-- Name: ComplianceReview_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ComplianceReview_status_idx" ON public."ComplianceReview" USING btree (status);


--
-- Name: CryptoAsset_blockchainId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoAsset_blockchainId_idx" ON public."CryptoAsset" USING btree ("blockchainId");


--
-- Name: CryptoAsset_symbol_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoAsset_symbol_idx" ON public."CryptoAsset" USING btree (symbol);


--
-- Name: CryptoAsset_symbol_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CryptoAsset_symbol_key" ON public."CryptoAsset" USING btree (symbol);


--
-- Name: CryptoConversion_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoConversion_merchantId_idx" ON public."CryptoConversion" USING btree ("merchantId");


--
-- Name: CryptoConversion_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoConversion_status_idx" ON public."CryptoConversion" USING btree (status);


--
-- Name: CryptoConversion_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoConversion_transactionId_idx" ON public."CryptoConversion" USING btree ("transactionId");


--
-- Name: CryptoConversion_walletTransferId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoConversion_walletTransferId_idx" ON public."CryptoConversion" USING btree ("walletTransferId");


--
-- Name: CryptoQuote_expiresAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoQuote_expiresAt_idx" ON public."CryptoQuote" USING btree ("expiresAt");


--
-- Name: CryptoQuote_fromCurrency_toCurrency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoQuote_fromCurrency_toCurrency_idx" ON public."CryptoQuote" USING btree ("fromCurrency", "toCurrency");


--
-- Name: CryptoRate_baseCurrency_quoteCurrency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoRate_baseCurrency_quoteCurrency_idx" ON public."CryptoRate" USING btree ("baseCurrency", "quoteCurrency");


--
-- Name: CryptoRate_baseCurrency_quoteCurrency_source_timestamp_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CryptoRate_baseCurrency_quoteCurrency_source_timestamp_key" ON public."CryptoRate" USING btree ("baseCurrency", "quoteCurrency", source, "timestamp");


--
-- Name: CryptoRate_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CryptoRate_timestamp_idx" ON public."CryptoRate" USING btree ("timestamp" DESC);


--
-- Name: CustomerActivity_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerActivity_createdAt_idx" ON public."CustomerActivity" USING btree ("createdAt" DESC);


--
-- Name: CustomerActivity_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerActivity_customerId_idx" ON public."CustomerActivity" USING btree ("customerId");


--
-- Name: CustomerAddress_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerAddress_customerId_idx" ON public."CustomerAddress" USING btree ("customerId");


--
-- Name: CustomerCard_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerCard_customerId_idx" ON public."CustomerCard" USING btree ("customerId");


--
-- Name: CustomerCard_token_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerCard_token_idx" ON public."CustomerCard" USING btree (token);


--
-- Name: CustomerCard_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CustomerCard_token_key" ON public."CustomerCard" USING btree (token);


--
-- Name: CustomerDevice_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerDevice_customerId_idx" ON public."CustomerDevice" USING btree ("customerId");


--
-- Name: CustomerDevice_deviceId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerDevice_deviceId_idx" ON public."CustomerDevice" USING btree ("deviceId");


--
-- Name: CustomerLoyalty_customerId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CustomerLoyalty_customerId_key" ON public."CustomerLoyalty" USING btree ("customerId");


--
-- Name: CustomerNotification_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerNotification_createdAt_idx" ON public."CustomerNotification" USING btree ("createdAt" DESC);


--
-- Name: CustomerNotification_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerNotification_customerId_idx" ON public."CustomerNotification" USING btree ("customerId");


--
-- Name: CustomerReward_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerReward_customerId_idx" ON public."CustomerReward" USING btree ("customerId");


--
-- Name: CustomerWallet_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerWallet_address_idx" ON public."CustomerWallet" USING btree (address);


--
-- Name: CustomerWallet_address_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "CustomerWallet_address_key" ON public."CustomerWallet" USING btree (address);


--
-- Name: CustomerWallet_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CustomerWallet_customerId_idx" ON public."CustomerWallet" USING btree ("customerId");


--
-- Name: Customer_deletedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_deletedAt_idx" ON public."Customer" USING btree ("deletedAt");


--
-- Name: Customer_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_email_idx" ON public."Customer" USING btree (email);


--
-- Name: Customer_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Customer_email_key" ON public."Customer" USING btree (email);


--
-- Name: Customer_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_merchantId_idx" ON public."Customer" USING btree ("merchantId");


--
-- Name: Customer_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_phone_idx" ON public."Customer" USING btree (phone);


--
-- Name: Customer_phone_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Customer_phone_key" ON public."Customer" USING btree (phone);


--
-- Name: Customer_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Customer_status_idx" ON public."Customer" USING btree (status);


--
-- Name: DashboardWidget_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DashboardWidget_merchantId_idx" ON public."DashboardWidget" USING btree ("merchantId");


--
-- Name: Department_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Department_merchantId_idx" ON public."Department" USING btree ("merchantId");


--
-- Name: Department_merchantId_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Department_merchantId_name_key" ON public."Department" USING btree ("merchantId", name);


--
-- Name: Device_serialNumber_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Device_serialNumber_idx" ON public."Device" USING btree ("serialNumber");


--
-- Name: Device_serialNumber_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Device_serialNumber_key" ON public."Device" USING btree ("serialNumber");


--
-- Name: Device_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Device_terminalId_idx" ON public."Device" USING btree ("terminalId");


--
-- Name: Device_terminalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Device_terminalId_key" ON public."Device" USING btree ("terminalId");


--
-- Name: DisputeEvidence_disputeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DisputeEvidence_disputeId_idx" ON public."DisputeEvidence" USING btree ("disputeId");


--
-- Name: Dispute_chargebackId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Dispute_chargebackId_idx" ON public."Dispute" USING btree ("chargebackId");


--
-- Name: Dispute_chargebackId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Dispute_chargebackId_key" ON public."Dispute" USING btree ("chargebackId");


--
-- Name: Dispute_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Dispute_merchantId_idx" ON public."Dispute" USING btree ("merchantId");


--
-- Name: Dispute_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Dispute_status_idx" ON public."Dispute" USING btree (status);


--
-- Name: Dispute_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Dispute_transactionId_idx" ON public."Dispute" USING btree ("transactionId");


--
-- Name: EmailVerification_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "EmailVerification_token_key" ON public."EmailVerification" USING btree (token);


--
-- Name: EmailVerification_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "EmailVerification_userId_idx" ON public."EmailVerification" USING btree ("userId");


--
-- Name: Employee_departmentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Employee_departmentId_idx" ON public."Employee" USING btree ("departmentId");


--
-- Name: Employee_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Employee_email_idx" ON public."Employee" USING btree (email);


--
-- Name: Employee_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Employee_email_key" ON public."Employee" USING btree (email);


--
-- Name: Employee_isActive_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Employee_isActive_idx" ON public."Employee" USING btree ("isActive");


--
-- Name: Employee_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Employee_merchantId_idx" ON public."Employee" USING btree ("merchantId");


--
-- Name: Employee_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Employee_userId_idx" ON public."Employee" USING btree ("userId");


--
-- Name: Employee_userId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Employee_userId_key" ON public."Employee" USING btree ("userId");


--
-- Name: ExchangeOrder_exchangeProviderId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeOrder_exchangeProviderId_idx" ON public."ExchangeOrder" USING btree ("exchangeProviderId");


--
-- Name: ExchangeOrder_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeOrder_merchantId_idx" ON public."ExchangeOrder" USING btree ("merchantId");


--
-- Name: ExchangeOrder_orderId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeOrder_orderId_idx" ON public."ExchangeOrder" USING btree ("orderId");


--
-- Name: ExchangeOrder_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeOrder_status_idx" ON public."ExchangeOrder" USING btree (status);


--
-- Name: ExchangeProvider_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeProvider_name_idx" ON public."ExchangeProvider" USING btree (name);


--
-- Name: ExchangeProvider_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ExchangeProvider_name_key" ON public."ExchangeProvider" USING btree (name);


--
-- Name: ExchangeQuote_exchangeProviderId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeQuote_exchangeProviderId_idx" ON public."ExchangeQuote" USING btree ("exchangeProviderId");


--
-- Name: ExchangeQuote_expiresAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeQuote_expiresAt_idx" ON public."ExchangeQuote" USING btree ("expiresAt");


--
-- Name: ExchangeQuote_fromCurrency_toCurrency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeQuote_fromCurrency_toCurrency_idx" ON public."ExchangeQuote" USING btree ("fromCurrency", "toCurrency");


--
-- Name: ExchangeRateHistory_fromCurrency_toCurrency_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeRateHistory_fromCurrency_toCurrency_timestamp_idx" ON public."ExchangeRateHistory" USING btree ("fromCurrency", "toCurrency", "timestamp" DESC);


--
-- Name: ExchangeRate_fromCurrency_toCurrency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeRate_fromCurrency_toCurrency_idx" ON public."ExchangeRate" USING btree ("fromCurrency", "toCurrency");


--
-- Name: ExchangeRate_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeRate_timestamp_idx" ON public."ExchangeRate" USING btree ("timestamp" DESC);


--
-- Name: ExchangeTrade_orderId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeTrade_orderId_idx" ON public."ExchangeTrade" USING btree ("orderId");


--
-- Name: ExchangeTrade_tradeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ExchangeTrade_tradeId_idx" ON public."ExchangeTrade" USING btree ("tradeId");


--
-- Name: GasHistory_networkId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GasHistory_networkId_idx" ON public."GasHistory" USING btree ("networkId");


--
-- Name: GasHistory_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GasHistory_timestamp_idx" ON public."GasHistory" USING btree ("timestamp" DESC);


--
-- Name: GasPrice_networkId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GasPrice_networkId_idx" ON public."GasPrice" USING btree ("networkId");


--
-- Name: GasPrice_timestamp_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GasPrice_timestamp_idx" ON public."GasPrice" USING btree ("timestamp" DESC);


--
-- Name: GatewayLog_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayLog_createdAt_idx" ON public."GatewayLog" USING btree ("createdAt" DESC);


--
-- Name: GatewayLog_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayLog_merchantId_idx" ON public."GatewayLog" USING btree ("merchantId");


--
-- Name: GatewayLog_provider_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayLog_provider_idx" ON public."GatewayLog" USING btree (provider);


--
-- Name: GatewayRequest_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayRequest_createdAt_idx" ON public."GatewayRequest" USING btree ("createdAt" DESC);


--
-- Name: GatewayRequest_providerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayRequest_providerId_idx" ON public."GatewayRequest" USING btree ("providerId");


--
-- Name: GatewayRequest_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayRequest_transactionId_idx" ON public."GatewayRequest" USING btree ("transactionId");


--
-- Name: GatewayRequest_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "GatewayRequest_transactionId_key" ON public."GatewayRequest" USING btree ("transactionId");


--
-- Name: GatewayResponse_gatewayRequestId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "GatewayResponse_gatewayRequestId_idx" ON public."GatewayResponse" USING btree ("gatewayRequestId");


--
-- Name: GatewayResponse_gatewayRequestId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "GatewayResponse_gatewayRequestId_key" ON public."GatewayResponse" USING btree ("gatewayRequestId");


--
-- Name: HotWalletTransfer_hotWalletAddress_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "HotWalletTransfer_hotWalletAddress_idx" ON public."HotWalletTransfer" USING btree ("hotWalletAddress");


--
-- Name: HotWalletTransfer_walletTransferId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "HotWalletTransfer_walletTransferId_idx" ON public."HotWalletTransfer" USING btree ("walletTransferId");


--
-- Name: HotWalletTransfer_walletTransferId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "HotWalletTransfer_walletTransferId_key" ON public."HotWalletTransfer" USING btree ("walletTransferId");


--
-- Name: IdentityVerification_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IdentityVerification_kycId_idx" ON public."IdentityVerification" USING btree ("kycId");


--
-- Name: InventoryAdjustment_inventoryId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryAdjustment_inventoryId_idx" ON public."InventoryAdjustment" USING btree ("inventoryId");


--
-- Name: InventoryAdjustment_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryAdjustment_productId_idx" ON public."InventoryAdjustment" USING btree ("productId");


--
-- Name: InventoryMovement_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryMovement_createdAt_idx" ON public."InventoryMovement" USING btree ("createdAt" DESC);


--
-- Name: InventoryMovement_inventoryId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryMovement_inventoryId_idx" ON public."InventoryMovement" USING btree ("inventoryId");


--
-- Name: InventoryMovement_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "InventoryMovement_productId_idx" ON public."InventoryMovement" USING btree ("productId");


--
-- Name: Inventory_location_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Inventory_location_idx" ON public."Inventory" USING btree (location);


--
-- Name: Inventory_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Inventory_merchantId_idx" ON public."Inventory" USING btree ("merchantId");


--
-- Name: Inventory_merchantId_productId_location_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Inventory_merchantId_productId_location_key" ON public."Inventory" USING btree ("merchantId", "productId", location);


--
-- Name: Inventory_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Inventory_productId_idx" ON public."Inventory" USING btree ("productId");


--
-- Name: KycDocument_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KycDocument_kycId_idx" ON public."KycDocument" USING btree ("kycId");


--
-- Name: KycReview_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "KycReview_kycId_idx" ON public."KycReview" USING btree ("kycId");


--
-- Name: Kyc_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Kyc_merchantId_idx" ON public."Kyc" USING btree ("merchantId");


--
-- Name: Kyc_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Kyc_merchantId_key" ON public."Kyc" USING btree ("merchantId");


--
-- Name: Kyc_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Kyc_status_idx" ON public."Kyc" USING btree (status);


--
-- Name: LiquidityPool_assetCurrency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LiquidityPool_assetCurrency_idx" ON public."LiquidityPool" USING btree ("assetCurrency");


--
-- Name: LiquidityPool_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LiquidityPool_merchantId_idx" ON public."LiquidityPool" USING btree ("merchantId");


--
-- Name: LoginHistory_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LoginHistory_createdAt_idx" ON public."LoginHistory" USING btree ("createdAt" DESC);


--
-- Name: LoginHistory_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LoginHistory_userId_idx" ON public."LoginHistory" USING btree ("userId");


--
-- Name: MerchantAddress_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantAddress_merchantId_idx" ON public."MerchantAddress" USING btree ("merchantId");


--
-- Name: MerchantBranding_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantBranding_merchantId_key" ON public."MerchantBranding" USING btree ("merchantId");


--
-- Name: MerchantBusinessHours_merchantId_dayOfWeek_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantBusinessHours_merchantId_dayOfWeek_key" ON public."MerchantBusinessHours" USING btree ("merchantId", "dayOfWeek");


--
-- Name: MerchantCompliance_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantCompliance_merchantId_key" ON public."MerchantCompliance" USING btree ("merchantId");


--
-- Name: MerchantContact_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantContact_merchantId_idx" ON public."MerchantContact" USING btree ("merchantId");


--
-- Name: MerchantDocument_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantDocument_merchantId_idx" ON public."MerchantDocument" USING btree ("merchantId");


--
-- Name: MerchantFeature_merchantId_featureName_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantFeature_merchantId_featureName_key" ON public."MerchantFeature" USING btree ("merchantId", "featureName");


--
-- Name: MerchantFeature_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantFeature_merchantId_idx" ON public."MerchantFeature" USING btree ("merchantId");


--
-- Name: MerchantFee_isActive_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantFee_isActive_idx" ON public."MerchantFee" USING btree ("isActive");


--
-- Name: MerchantFee_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantFee_merchantId_idx" ON public."MerchantFee" USING btree ("merchantId");


--
-- Name: MerchantLimits_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantLimits_merchantId_key" ON public."MerchantLimits" USING btree ("merchantId");


--
-- Name: MerchantNotificationSettings_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantNotificationSettings_merchantId_key" ON public."MerchantNotificationSettings" USING btree ("merchantId");


--
-- Name: MerchantSecuritySettings_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantSecuritySettings_merchantId_key" ON public."MerchantSecuritySettings" USING btree ("merchantId");


--
-- Name: MerchantSettings_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantSettings_merchantId_key" ON public."MerchantSettings" USING btree ("merchantId");


--
-- Name: MerchantSubscription_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MerchantSubscription_merchantId_idx" ON public."MerchantSubscription" USING btree ("merchantId");


--
-- Name: MerchantSubscription_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantSubscription_merchantId_key" ON public."MerchantSubscription" USING btree ("merchantId");


--
-- Name: MerchantWebhookSettings_merchantId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "MerchantWebhookSettings_merchantId_key" ON public."MerchantWebhookSettings" USING btree ("merchantId");


--
-- Name: Merchant_deletedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Merchant_deletedAt_idx" ON public."Merchant" USING btree ("deletedAt");


--
-- Name: Merchant_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Merchant_email_idx" ON public."Merchant" USING btree (email);


--
-- Name: Merchant_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Merchant_email_key" ON public."Merchant" USING btree (email);


--
-- Name: Merchant_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Merchant_phone_idx" ON public."Merchant" USING btree (phone);


--
-- Name: Merchant_phone_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Merchant_phone_key" ON public."Merchant" USING btree (phone);


--
-- Name: Merchant_registrationNumber_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Merchant_registrationNumber_idx" ON public."Merchant" USING btree ("registrationNumber");


--
-- Name: Merchant_registrationNumber_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Merchant_registrationNumber_key" ON public."Merchant" USING btree ("registrationNumber");


--
-- Name: Merchant_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Merchant_status_idx" ON public."Merchant" USING btree (status);


--
-- Name: NotificationLog_notificationId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "NotificationLog_notificationId_idx" ON public."NotificationLog" USING btree ("notificationId");


--
-- Name: Notification_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notification_createdAt_idx" ON public."Notification" USING btree ("createdAt" DESC);


--
-- Name: Notification_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notification_customerId_idx" ON public."Notification" USING btree ("customerId");


--
-- Name: Notification_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notification_merchantId_idx" ON public."Notification" USING btree ("merchantId");


--
-- Name: Notification_readAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notification_readAt_idx" ON public."Notification" USING btree ("readAt");


--
-- Name: Notification_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Notification_userId_idx" ON public."Notification" USING btree ("userId");


--
-- Name: OAuthAccount_provider_providerId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "OAuthAccount_provider_providerId_key" ON public."OAuthAccount" USING btree (provider, "providerId");


--
-- Name: OAuthAccount_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "OAuthAccount_userId_idx" ON public."OAuthAccount" USING btree ("userId");


--
-- Name: PEPCheck_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PEPCheck_kycId_idx" ON public."PEPCheck" USING btree ("kycId");


--
-- Name: PasswordReset_expiresAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PasswordReset_expiresAt_idx" ON public."PasswordReset" USING btree ("expiresAt");


--
-- Name: PasswordReset_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PasswordReset_token_key" ON public."PasswordReset" USING btree (token);


--
-- Name: PasswordReset_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PasswordReset_userId_idx" ON public."PasswordReset" USING btree ("userId");


--
-- Name: PaymentAttempt_paymentIntentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentAttempt_paymentIntentId_idx" ON public."PaymentAttempt" USING btree ("paymentIntentId");


--
-- Name: PaymentAttempt_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentAttempt_status_idx" ON public."PaymentAttempt" USING btree (status);


--
-- Name: PaymentAttempt_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentAttempt_transactionId_idx" ON public."PaymentAttempt" USING btree ("transactionId");


--
-- Name: PaymentIntent_clientSecret_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentIntent_clientSecret_idx" ON public."PaymentIntent" USING btree ("clientSecret");


--
-- Name: PaymentIntent_clientSecret_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PaymentIntent_clientSecret_key" ON public."PaymentIntent" USING btree ("clientSecret");


--
-- Name: PaymentIntent_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentIntent_customerId_idx" ON public."PaymentIntent" USING btree ("customerId");


--
-- Name: PaymentIntent_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentIntent_merchantId_idx" ON public."PaymentIntent" USING btree ("merchantId");


--
-- Name: PaymentIntent_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentIntent_status_idx" ON public."PaymentIntent" USING btree (status);


--
-- Name: PaymentMethod_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentMethod_customerId_idx" ON public."PaymentMethod" USING btree ("customerId");


--
-- Name: PaymentMethod_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentMethod_merchantId_idx" ON public."PaymentMethod" USING btree ("merchantId");


--
-- Name: PaymentMethod_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentMethod_type_idx" ON public."PaymentMethod" USING btree (type);


--
-- Name: PaymentProvider_isActive_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentProvider_isActive_idx" ON public."PaymentProvider" USING btree ("isActive");


--
-- Name: PaymentProvider_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "PaymentProvider_name_key" ON public."PaymentProvider" USING btree (name);


--
-- Name: PaymentProvider_priority_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PaymentProvider_priority_idx" ON public."PaymentProvider" USING btree (priority);


--
-- Name: Payroll_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Payroll_employeeId_idx" ON public."Payroll" USING btree ("employeeId");


--
-- Name: Payroll_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Payroll_merchantId_idx" ON public."Payroll" USING btree ("merchantId");


--
-- Name: Payroll_periodStart_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Payroll_periodStart_idx" ON public."Payroll" USING btree ("periodStart");


--
-- Name: Permission_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Permission_name_idx" ON public."Permission" USING btree (name);


--
-- Name: Permission_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Permission_name_key" ON public."Permission" USING btree (name);


--
-- Name: Permission_resource_action_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Permission_resource_action_idx" ON public."Permission" USING btree (resource, action);


--
-- Name: Printer_terminalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Printer_terminalId_key" ON public."Printer" USING btree ("terminalId");


--
-- Name: Product_barcode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_barcode_idx" ON public."Product" USING btree (barcode);


--
-- Name: Product_brandId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_brandId_idx" ON public."Product" USING btree ("brandId");


--
-- Name: Product_categoryId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_categoryId_idx" ON public."Product" USING btree ("categoryId");


--
-- Name: Product_deletedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_deletedAt_idx" ON public."Product" USING btree ("deletedAt");


--
-- Name: Product_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_merchantId_idx" ON public."Product" USING btree ("merchantId");


--
-- Name: Product_sku_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Product_sku_idx" ON public."Product" USING btree (sku);


--
-- Name: Product_sku_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Product_sku_key" ON public."Product" USING btree (sku);


--
-- Name: ProviderMetric_provider_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ProviderMetric_provider_key" ON public."ProviderMetric" USING btree (provider);


--
-- Name: ProviderResponse_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProviderResponse_createdAt_idx" ON public."ProviderResponse" USING btree ("createdAt" DESC);


--
-- Name: ProviderResponse_providerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProviderResponse_providerId_idx" ON public."ProviderResponse" USING btree ("providerId");


--
-- Name: ProviderResponse_requestId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ProviderResponse_requestId_idx" ON public."ProviderResponse" USING btree ("requestId");


--
-- Name: PurchaseItem_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PurchaseItem_productId_idx" ON public."PurchaseItem" USING btree ("productId");


--
-- Name: PurchaseItem_purchaseId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "PurchaseItem_purchaseId_idx" ON public."PurchaseItem" USING btree ("purchaseId");


--
-- Name: Purchase_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Purchase_merchantId_idx" ON public."Purchase" USING btree ("merchantId");


--
-- Name: Purchase_reference_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Purchase_reference_idx" ON public."Purchase" USING btree (reference);


--
-- Name: Purchase_reference_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Purchase_reference_key" ON public."Purchase" USING btree (reference);


--
-- Name: Purchase_supplierId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Purchase_supplierId_idx" ON public."Purchase" USING btree ("supplierId");


--
-- Name: ReceiptTemplate_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReceiptTemplate_merchantId_idx" ON public."ReceiptTemplate" USING btree ("merchantId");


--
-- Name: ReceiptTemplate_merchantId_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "ReceiptTemplate_merchantId_name_key" ON public."ReceiptTemplate" USING btree ("merchantId", name);


--
-- Name: RefreshToken_expiresAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RefreshToken_expiresAt_idx" ON public."RefreshToken" USING btree ("expiresAt");


--
-- Name: RefreshToken_replacedBy_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RefreshToken_replacedBy_key" ON public."RefreshToken" USING btree ("replacedBy");


--
-- Name: RefreshToken_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RefreshToken_token_key" ON public."RefreshToken" USING btree (token);


--
-- Name: RefreshToken_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RefreshToken_userId_idx" ON public."RefreshToken" USING btree ("userId");


--
-- Name: RefundReason_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RefundReason_merchantId_idx" ON public."RefundReason" USING btree ("merchantId");


--
-- Name: RefundReason_reason_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RefundReason_reason_key" ON public."RefundReason" USING btree (reason);


--
-- Name: Refund_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_merchantId_idx" ON public."Refund" USING btree ("merchantId");


--
-- Name: Refund_refundReference_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_refundReference_idx" ON public."Refund" USING btree ("refundReference");


--
-- Name: Refund_refundReference_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Refund_refundReference_key" ON public."Refund" USING btree ("refundReference");


--
-- Name: Refund_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_status_idx" ON public."Refund" USING btree (status);


--
-- Name: Refund_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_transactionId_idx" ON public."Refund" USING btree ("transactionId");


--
-- Name: ReportExport_reportId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ReportExport_reportId_idx" ON public."ReportExport" USING btree ("reportId");


--
-- Name: Report_generatedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Report_generatedAt_idx" ON public."Report" USING btree ("generatedAt" DESC);


--
-- Name: Report_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Report_merchantId_idx" ON public."Report" USING btree ("merchantId");


--
-- Name: Report_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Report_type_idx" ON public."Report" USING btree (type);


--
-- Name: Reversal_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Reversal_transactionId_idx" ON public."Reversal" USING btree ("transactionId");


--
-- Name: Reversal_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Reversal_transactionId_key" ON public."Reversal" USING btree ("transactionId");


--
-- Name: RiskAssessment_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RiskAssessment_kycId_idx" ON public."RiskAssessment" USING btree ("kycId");


--
-- Name: RolePermission_roleId_permissionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RolePermission_roleId_permissionId_key" ON public."RolePermission" USING btree ("roleId", "permissionId");


--
-- Name: Role_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Role_name_idx" ON public."Role" USING btree (name);


--
-- Name: Role_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Role_name_key" ON public."Role" USING btree (name);


--
-- Name: Salary_effectiveDate_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Salary_effectiveDate_idx" ON public."Salary" USING btree ("effectiveDate");


--
-- Name: Salary_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Salary_employeeId_idx" ON public."Salary" USING btree ("employeeId");


--
-- Name: SanctionCheck_kycId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SanctionCheck_kycId_idx" ON public."SanctionCheck" USING btree ("kycId");


--
-- Name: Scanner_terminalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Scanner_terminalId_key" ON public."Scanner" USING btree ("terminalId");


--
-- Name: Session_expiresAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Session_expiresAt_idx" ON public."Session" USING btree ("expiresAt");


--
-- Name: Session_sessionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Session_sessionId_key" ON public."Session" USING btree ("sessionId");


--
-- Name: Session_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Session_userId_idx" ON public."Session" USING btree ("userId");


--
-- Name: SettlementAttempt_settlementId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementAttempt_settlementId_idx" ON public."SettlementAttempt" USING btree ("settlementId");


--
-- Name: SettlementBatch_batchReference_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementBatch_batchReference_idx" ON public."SettlementBatch" USING btree ("batchReference");


--
-- Name: SettlementBatch_batchReference_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "SettlementBatch_batchReference_key" ON public."SettlementBatch" USING btree ("batchReference");


--
-- Name: SettlementBatch_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementBatch_merchantId_idx" ON public."SettlementBatch" USING btree ("merchantId");


--
-- Name: SettlementBatch_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementBatch_status_idx" ON public."SettlementBatch" USING btree (status);


--
-- Name: SettlementFee_settlementId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementFee_settlementId_idx" ON public."SettlementFee" USING btree ("settlementId");


--
-- Name: SettlementRule_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementRule_merchantId_idx" ON public."SettlementRule" USING btree ("merchantId");


--
-- Name: SettlementSchedule_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SettlementSchedule_merchantId_idx" ON public."SettlementSchedule" USING btree ("merchantId");


--
-- Name: Settlement_batchId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Settlement_batchId_idx" ON public."Settlement" USING btree ("batchId");


--
-- Name: Settlement_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Settlement_createdAt_idx" ON public."Settlement" USING btree ("createdAt" DESC);


--
-- Name: Settlement_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Settlement_merchantId_idx" ON public."Settlement" USING btree ("merchantId");


--
-- Name: Settlement_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Settlement_status_idx" ON public."Settlement" USING btree (status);


--
-- Name: Settlement_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Settlement_walletId_idx" ON public."Settlement" USING btree ("walletId");


--
-- Name: Shift_employeeId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Shift_employeeId_idx" ON public."Shift" USING btree ("employeeId");


--
-- Name: Shift_startTime_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Shift_startTime_idx" ON public."Shift" USING btree ("startTime");


--
-- Name: Supplier_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Supplier_merchantId_idx" ON public."Supplier" USING btree ("merchantId");


--
-- Name: SystemConfiguration_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SystemConfiguration_key_idx" ON public."SystemConfiguration" USING btree (key);


--
-- Name: SystemConfiguration_key_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "SystemConfiguration_key_key" ON public."SystemConfiguration" USING btree (key);


--
-- Name: SystemSetting_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SystemSetting_key_idx" ON public."SystemSetting" USING btree (key);


--
-- Name: SystemSetting_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SystemSetting_merchantId_idx" ON public."SystemSetting" USING btree ("merchantId");


--
-- Name: SystemSetting_merchantId_key_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "SystemSetting_merchantId_key_key" ON public."SystemSetting" USING btree ("merchantId", key);


--
-- Name: TerminalConfiguration_terminalId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TerminalConfiguration_terminalId_key" ON public."TerminalConfiguration" USING btree ("terminalId");


--
-- Name: TerminalGroup_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalGroup_merchantId_idx" ON public."TerminalGroup" USING btree ("merchantId");


--
-- Name: TerminalGroup_merchantId_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TerminalGroup_merchantId_name_key" ON public."TerminalGroup" USING btree ("merchantId", name);


--
-- Name: TerminalHeartbeat_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalHeartbeat_createdAt_idx" ON public."TerminalHeartbeat" USING btree ("createdAt" DESC);


--
-- Name: TerminalHeartbeat_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalHeartbeat_terminalId_idx" ON public."TerminalHeartbeat" USING btree ("terminalId");


--
-- Name: TerminalKey_keyHash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalKey_keyHash_idx" ON public."TerminalKey" USING btree ("keyHash");


--
-- Name: TerminalKey_keyHash_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TerminalKey_keyHash_key" ON public."TerminalKey" USING btree ("keyHash");


--
-- Name: TerminalKey_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalKey_terminalId_idx" ON public."TerminalKey" USING btree ("terminalId");


--
-- Name: TerminalLocation_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalLocation_terminalId_idx" ON public."TerminalLocation" USING btree ("terminalId");


--
-- Name: TerminalLog_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalLog_createdAt_idx" ON public."TerminalLog" USING btree ("createdAt" DESC);


--
-- Name: TerminalLog_level_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalLog_level_idx" ON public."TerminalLog" USING btree (level);


--
-- Name: TerminalLog_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalLog_terminalId_idx" ON public."TerminalLog" USING btree ("terminalId");


--
-- Name: TerminalSoftware_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TerminalSoftware_terminalId_idx" ON public."TerminalSoftware" USING btree ("terminalId");


--
-- Name: TerminalSoftware_terminalId_version_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TerminalSoftware_terminalId_version_key" ON public."TerminalSoftware" USING btree ("terminalId", version);


--
-- Name: Terminal_deletedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Terminal_deletedAt_idx" ON public."Terminal" USING btree ("deletedAt");


--
-- Name: Terminal_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Terminal_merchantId_idx" ON public."Terminal" USING btree ("merchantId");


--
-- Name: Terminal_serialNumber_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Terminal_serialNumber_idx" ON public."Terminal" USING btree ("serialNumber");


--
-- Name: Terminal_serialNumber_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Terminal_serialNumber_key" ON public."Terminal" USING btree ("serialNumber");


--
-- Name: Terminal_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Terminal_status_idx" ON public."Terminal" USING btree (status);


--
-- Name: Terminal_terminalGroupId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Terminal_terminalGroupId_idx" ON public."Terminal" USING btree ("terminalGroupId");


--
-- Name: TransactionDiscount_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionDiscount_transactionId_idx" ON public."TransactionDiscount" USING btree ("transactionId");


--
-- Name: TransactionEvent_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionEvent_createdAt_idx" ON public."TransactionEvent" USING btree ("createdAt" DESC);


--
-- Name: TransactionEvent_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionEvent_transactionId_idx" ON public."TransactionEvent" USING btree ("transactionId");


--
-- Name: TransactionFee_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionFee_transactionId_idx" ON public."TransactionFee" USING btree ("transactionId");


--
-- Name: TransactionFee_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionFee_walletId_idx" ON public."TransactionFee" USING btree ("walletId");


--
-- Name: TransactionItem_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionItem_productId_idx" ON public."TransactionItem" USING btree ("productId");


--
-- Name: TransactionItem_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionItem_transactionId_idx" ON public."TransactionItem" USING btree ("transactionId");


--
-- Name: TransactionMetadata_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionMetadata_transactionId_idx" ON public."TransactionMetadata" USING btree ("transactionId");


--
-- Name: TransactionMetadata_transactionId_key_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "TransactionMetadata_transactionId_key_key" ON public."TransactionMetadata" USING btree ("transactionId", key);


--
-- Name: TransactionStatusHistory_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionStatusHistory_createdAt_idx" ON public."TransactionStatusHistory" USING btree ("createdAt" DESC);


--
-- Name: TransactionStatusHistory_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionStatusHistory_transactionId_idx" ON public."TransactionStatusHistory" USING btree ("transactionId");


--
-- Name: TransactionTax_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionTax_transactionId_idx" ON public."TransactionTax" USING btree ("transactionId");


--
-- Name: TransactionTimeline_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionTimeline_createdAt_idx" ON public."TransactionTimeline" USING btree ("createdAt" DESC);


--
-- Name: TransactionTimeline_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TransactionTimeline_transactionId_idx" ON public."TransactionTimeline" USING btree ("transactionId");


--
-- Name: Transaction_blockchainTransactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Transaction_blockchainTransactionId_key" ON public."Transaction" USING btree ("blockchainTransactionId");


--
-- Name: Transaction_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_createdAt_idx" ON public."Transaction" USING btree ("createdAt" DESC);


--
-- Name: Transaction_cryptoConversionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_cryptoConversionId_idx" ON public."Transaction" USING btree ("cryptoConversionId");


--
-- Name: Transaction_customerId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_customerId_idx" ON public."Transaction" USING btree ("customerId");


--
-- Name: Transaction_gatewayTransactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_gatewayTransactionId_idx" ON public."Transaction" USING btree ("gatewayTransactionId");


--
-- Name: Transaction_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_merchantId_idx" ON public."Transaction" USING btree ("merchantId");


--
-- Name: Transaction_paymentIntentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_paymentIntentId_idx" ON public."Transaction" USING btree ("paymentIntentId");


--
-- Name: Transaction_paymentMethod_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_paymentMethod_idx" ON public."Transaction" USING btree ("paymentMethod");


--
-- Name: Transaction_reference_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_reference_idx" ON public."Transaction" USING btree (reference);


--
-- Name: Transaction_reference_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Transaction_reference_key" ON public."Transaction" USING btree (reference);


--
-- Name: Transaction_settlementStatus_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_settlementStatus_idx" ON public."Transaction" USING btree ("settlementStatus");


--
-- Name: Transaction_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_status_idx" ON public."Transaction" USING btree (status);


--
-- Name: Transaction_terminalId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_terminalId_idx" ON public."Transaction" USING btree ("terminalId");


--
-- Name: Transaction_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Transaction_walletId_idx" ON public."Transaction" USING btree ("walletId");


--
-- Name: UserPermission_permissionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserPermission_permissionId_idx" ON public."UserPermission" USING btree ("permissionId");


--
-- Name: UserPermission_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UserPermission_userId_idx" ON public."UserPermission" USING btree ("userId");


--
-- Name: UserPermission_userId_permissionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserPermission_userId_permissionId_key" ON public."UserPermission" USING btree ("userId", "permissionId");


--
-- Name: User_assignedRoleId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_assignedRoleId_idx" ON public."User" USING btree ("assignedRoleId");


--
-- Name: User_deletedAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_deletedAt_idx" ON public."User" USING btree ("deletedAt");


--
-- Name: User_emailVerifyToken_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_emailVerifyToken_key" ON public."User" USING btree ("emailVerifyToken");


--
-- Name: User_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_email_idx" ON public."User" USING btree (email);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: User_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_merchantId_idx" ON public."User" USING btree ("merchantId");


--
-- Name: User_passwordResetToken_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_passwordResetToken_key" ON public."User" USING btree ("passwordResetToken");


--
-- Name: User_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_phone_idx" ON public."User" USING btree (phone);


--
-- Name: User_phone_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_phone_key" ON public."User" USING btree (phone);


--
-- Name: User_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_role_idx" ON public."User" USING btree (role);


--
-- Name: User_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "User_status_idx" ON public."User" USING btree (status);


--
-- Name: VoidTransaction_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "VoidTransaction_transactionId_idx" ON public."VoidTransaction" USING btree ("transactionId");


--
-- Name: VoidTransaction_transactionId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "VoidTransaction_transactionId_key" ON public."VoidTransaction" USING btree ("transactionId");


--
-- Name: WalletAddress_address_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "WalletAddress_address_key" ON public."WalletAddress" USING btree (address);


--
-- Name: WalletAddress_blockchainId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletAddress_blockchainId_idx" ON public."WalletAddress" USING btree ("blockchainId");


--
-- Name: WalletAddress_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletAddress_walletId_idx" ON public."WalletAddress" USING btree ("walletId");


--
-- Name: WalletAudit_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletAudit_createdAt_idx" ON public."WalletAudit" USING btree ("createdAt" DESC);


--
-- Name: WalletAudit_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletAudit_walletId_idx" ON public."WalletAudit" USING btree ("walletId");


--
-- Name: WalletBalance_snapshotAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletBalance_snapshotAt_idx" ON public."WalletBalance" USING btree ("snapshotAt");


--
-- Name: WalletBalance_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletBalance_walletId_idx" ON public."WalletBalance" USING btree ("walletId");


--
-- Name: WalletKey_keyHash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletKey_keyHash_idx" ON public."WalletKey" USING btree ("keyHash");


--
-- Name: WalletKey_keyHash_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "WalletKey_keyHash_key" ON public."WalletKey" USING btree ("keyHash");


--
-- Name: WalletKey_walletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletKey_walletId_idx" ON public."WalletKey" USING btree ("walletId");


--
-- Name: WalletTransfer_blockchainTxId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_blockchainTxId_idx" ON public."WalletTransfer" USING btree ("blockchainTxId");


--
-- Name: WalletTransfer_blockchainTxId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "WalletTransfer_blockchainTxId_key" ON public."WalletTransfer" USING btree ("blockchainTxId");


--
-- Name: WalletTransfer_cryptoConversionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_cryptoConversionId_idx" ON public."WalletTransfer" USING btree ("cryptoConversionId");


--
-- Name: WalletTransfer_fromWalletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_fromWalletId_idx" ON public."WalletTransfer" USING btree ("fromWalletId");


--
-- Name: WalletTransfer_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_merchantId_idx" ON public."WalletTransfer" USING btree ("merchantId");


--
-- Name: WalletTransfer_reference_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_reference_idx" ON public."WalletTransfer" USING btree (reference);


--
-- Name: WalletTransfer_reference_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "WalletTransfer_reference_key" ON public."WalletTransfer" USING btree (reference);


--
-- Name: WalletTransfer_refundId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_refundId_idx" ON public."WalletTransfer" USING btree ("refundId");


--
-- Name: WalletTransfer_refundId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "WalletTransfer_refundId_key" ON public."WalletTransfer" USING btree ("refundId");


--
-- Name: WalletTransfer_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_status_idx" ON public."WalletTransfer" USING btree (status);


--
-- Name: WalletTransfer_toWalletId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WalletTransfer_toWalletId_idx" ON public."WalletTransfer" USING btree ("toWalletId");


--
-- Name: Wallet_address_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_address_idx" ON public."Wallet" USING btree (address);


--
-- Name: Wallet_bankAccountId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Wallet_bankAccountId_key" ON public."Wallet" USING btree ("bankAccountId");


--
-- Name: Wallet_blockchainId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_blockchainId_idx" ON public."Wallet" USING btree ("blockchainId");


--
-- Name: Wallet_currency_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_currency_idx" ON public."Wallet" USING btree (currency);


--
-- Name: Wallet_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_merchantId_idx" ON public."Wallet" USING btree ("merchantId");


--
-- Name: Wallet_type_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Wallet_type_idx" ON public."Wallet" USING btree (type);


--
-- Name: WebhookDelivery_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookDelivery_createdAt_idx" ON public."WebhookDelivery" USING btree ("createdAt" DESC);


--
-- Name: WebhookDelivery_status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookDelivery_status_idx" ON public."WebhookDelivery" USING btree (status);


--
-- Name: WebhookDelivery_transactionId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookDelivery_transactionId_idx" ON public."WebhookDelivery" USING btree ("transactionId");


--
-- Name: WebhookDelivery_webhookId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookDelivery_webhookId_idx" ON public."WebhookDelivery" USING btree ("webhookId");


--
-- Name: WebhookEvent_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookEvent_createdAt_idx" ON public."WebhookEvent" USING btree ("createdAt" DESC);


--
-- Name: WebhookEvent_eventName_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookEvent_eventName_idx" ON public."WebhookEvent" USING btree ("eventName");


--
-- Name: WebhookEvent_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookEvent_merchantId_idx" ON public."WebhookEvent" USING btree ("merchantId");


--
-- Name: WebhookRetry_scheduledAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookRetry_scheduledAt_idx" ON public."WebhookRetry" USING btree ("scheduledAt");


--
-- Name: WebhookRetry_webhookDeliveryId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "WebhookRetry_webhookDeliveryId_idx" ON public."WebhookRetry" USING btree ("webhookDeliveryId");


--
-- Name: Webhook_isActive_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Webhook_isActive_idx" ON public."Webhook" USING btree ("isActive");


--
-- Name: Webhook_merchantId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Webhook_merchantId_idx" ON public."Webhook" USING btree ("merchantId");


--
-- Name: AMLCheck AMLCheck_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AMLCheck"
    ADD CONSTRAINT "AMLCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ActivityLog ActivityLog_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActivityLog"
    ADD CONSTRAINT "ActivityLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ActivityLog ActivityLog_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActivityLog"
    ADD CONSTRAINT "ActivityLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: AddressVerification AddressVerification_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AddressVerification"
    ADD CONSTRAINT "AddressVerification_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ApiKeyUsage ApiKeyUsage_apiKeyId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiKeyUsage"
    ADD CONSTRAINT "ApiKeyUsage_apiKeyId_fkey" FOREIGN KEY ("apiKeyId") REFERENCES public."ApiKey"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ApiKey ApiKey_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiKey"
    ADD CONSTRAINT "ApiKey_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ApiKey ApiKey_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiKey"
    ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Attendance Attendance_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: AuditLog AuditLog_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: AuditLog AuditLog_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: AuditLog AuditLog_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuditLog"
    ADD CONSTRAINT "AuditLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Authorization Authorization_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Authorization"
    ADD CONSTRAINT "Authorization_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BackupHistory BackupHistory_backupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BackupHistory"
    ADD CONSTRAINT "BackupHistory_backupId_fkey" FOREIGN KEY ("backupId") REFERENCES public."Backup"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BankAccount BankAccount_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BankAccount"
    ADD CONSTRAINT "BankAccount_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BlockchainConfirmation BlockchainConfirmation_txId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainConfirmation"
    ADD CONSTRAINT "BlockchainConfirmation_txId_fkey" FOREIGN KEY ("txId") REFERENCES public."BlockchainTransaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BlockchainExplorer BlockchainExplorer_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainExplorer"
    ADD CONSTRAINT "BlockchainExplorer_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BlockchainFee BlockchainFee_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainFee"
    ADD CONSTRAINT "BlockchainFee_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BlockchainTransaction BlockchainTransaction_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainTransaction"
    ADD CONSTRAINT "BlockchainTransaction_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: BlockchainTransaction BlockchainTransaction_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BlockchainTransaction"
    ADD CONSTRAINT "BlockchainTransaction_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Brand Brand_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Capture Capture_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Capture"
    ADD CONSTRAINT "Capture_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CardPayment CardPayment_cardTokenId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardPayment"
    ADD CONSTRAINT "CardPayment_cardTokenId_fkey" FOREIGN KEY ("cardTokenId") REFERENCES public."CardToken"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CardPayment CardPayment_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardPayment"
    ADD CONSTRAINT "CardPayment_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CardToken CardToken_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardToken"
    ADD CONSTRAINT "CardToken_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CardToken CardToken_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CardToken"
    ADD CONSTRAINT "CardToken_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CashDrawer CashDrawer_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CashDrawer"
    ADD CONSTRAINT "CashDrawer_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Category Category_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Category Category_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ChargebackEvidence ChargebackEvidence_chargebackId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ChargebackEvidence"
    ADD CONSTRAINT "ChargebackEvidence_chargebackId_fkey" FOREIGN KEY ("chargebackId") REFERENCES public."Chargeback"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chargeback Chargeback_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chargeback"
    ADD CONSTRAINT "Chargeback_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Chargeback Chargeback_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Chargeback"
    ADD CONSTRAINT "Chargeback_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ClockIn ClockIn_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClockIn"
    ADD CONSTRAINT "ClockIn_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ClockOut ClockOut_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClockOut"
    ADD CONSTRAINT "ClockOut_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ColdWalletTransfer ColdWalletTransfer_walletTransferId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ColdWalletTransfer"
    ADD CONSTRAINT "ColdWalletTransfer_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES public."WalletTransfer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Commission Commission_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Commission"
    ADD CONSTRAINT "Commission_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Commission Commission_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Commission"
    ADD CONSTRAINT "Commission_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ComplianceLog ComplianceLog_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComplianceLog"
    ADD CONSTRAINT "ComplianceLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ComplianceReview ComplianceReview_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComplianceReview"
    ADD CONSTRAINT "ComplianceReview_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CryptoAsset CryptoAsset_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoAsset"
    ADD CONSTRAINT "CryptoAsset_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CryptoConversion CryptoConversion_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoConversion"
    ADD CONSTRAINT "CryptoConversion_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CryptoConversion CryptoConversion_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoConversion"
    ADD CONSTRAINT "CryptoConversion_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CryptoConversion CryptoConversion_walletTransferId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CryptoConversion"
    ADD CONSTRAINT "CryptoConversion_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES public."WalletTransfer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: CustomerActivity CustomerActivity_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerActivity"
    ADD CONSTRAINT "CustomerActivity_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerAddress CustomerAddress_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerAddress"
    ADD CONSTRAINT "CustomerAddress_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerCard CustomerCard_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerCard"
    ADD CONSTRAINT "CustomerCard_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerDevice CustomerDevice_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerDevice"
    ADD CONSTRAINT "CustomerDevice_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerLoyalty CustomerLoyalty_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerLoyalty"
    ADD CONSTRAINT "CustomerLoyalty_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerNotification CustomerNotification_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerNotification"
    ADD CONSTRAINT "CustomerNotification_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerReward CustomerReward_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerReward"
    ADD CONSTRAINT "CustomerReward_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerWallet CustomerWallet_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerWallet"
    ADD CONSTRAINT "CustomerWallet_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomerWallet CustomerWallet_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CustomerWallet"
    ADD CONSTRAINT "CustomerWallet_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Customer Customer_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: DashboardWidget DashboardWidget_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DashboardWidget"
    ADD CONSTRAINT "DashboardWidget_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Department Department_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Device Device_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Device"
    ADD CONSTRAINT "Device_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: DisputeEvidence DisputeEvidence_disputeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisputeEvidence"
    ADD CONSTRAINT "DisputeEvidence_disputeId_fkey" FOREIGN KEY ("disputeId") REFERENCES public."Dispute"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Dispute Dispute_chargebackId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispute"
    ADD CONSTRAINT "Dispute_chargebackId_fkey" FOREIGN KEY ("chargebackId") REFERENCES public."Chargeback"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Dispute Dispute_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispute"
    ADD CONSTRAINT "Dispute_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Dispute Dispute_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dispute"
    ADD CONSTRAINT "Dispute_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: EmailVerification EmailVerification_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EmailVerification"
    ADD CONSTRAINT "EmailVerification_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Employee Employee_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public."Department"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Employee Employee_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Employee Employee_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT "Employee_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ExchangeOrder ExchangeOrder_exchangeProviderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeOrder"
    ADD CONSTRAINT "ExchangeOrder_exchangeProviderId_fkey" FOREIGN KEY ("exchangeProviderId") REFERENCES public."ExchangeProvider"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ExchangeOrder ExchangeOrder_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeOrder"
    ADD CONSTRAINT "ExchangeOrder_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: ExchangeQuote ExchangeQuote_exchangeProviderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeQuote"
    ADD CONSTRAINT "ExchangeQuote_exchangeProviderId_fkey" FOREIGN KEY ("exchangeProviderId") REFERENCES public."ExchangeProvider"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ExchangeTrade ExchangeTrade_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ExchangeTrade"
    ADD CONSTRAINT "ExchangeTrade_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."ExchangeOrder"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GasHistory GasHistory_networkId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasHistory"
    ADD CONSTRAINT "GasHistory_networkId_fkey" FOREIGN KEY ("networkId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GasPrice GasPrice_networkId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GasPrice"
    ADD CONSTRAINT "GasPrice_networkId_fkey" FOREIGN KEY ("networkId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GatewayLog GatewayLog_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayLog"
    ADD CONSTRAINT "GatewayLog_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: GatewayRequest GatewayRequest_providerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayRequest"
    ADD CONSTRAINT "GatewayRequest_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES public."PaymentProvider"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: GatewayRequest GatewayRequest_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayRequest"
    ADD CONSTRAINT "GatewayRequest_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: GatewayResponse GatewayResponse_gatewayRequestId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GatewayResponse"
    ADD CONSTRAINT "GatewayResponse_gatewayRequestId_fkey" FOREIGN KEY ("gatewayRequestId") REFERENCES public."GatewayRequest"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HotWalletTransfer HotWalletTransfer_walletTransferId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HotWalletTransfer"
    ADD CONSTRAINT "HotWalletTransfer_walletTransferId_fkey" FOREIGN KEY ("walletTransferId") REFERENCES public."WalletTransfer"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: IdentityVerification IdentityVerification_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityVerification"
    ADD CONSTRAINT "IdentityVerification_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: InventoryAdjustment InventoryAdjustment_inventoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryAdjustment"
    ADD CONSTRAINT "InventoryAdjustment_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES public."Inventory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: InventoryAdjustment InventoryAdjustment_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryAdjustment"
    ADD CONSTRAINT "InventoryAdjustment_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: InventoryMovement InventoryMovement_inventoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryMovement"
    ADD CONSTRAINT "InventoryMovement_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES public."Inventory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: InventoryMovement InventoryMovement_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."InventoryMovement"
    ADD CONSTRAINT "InventoryMovement_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Inventory Inventory_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Inventory Inventory_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KycDocument KycDocument_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KycDocument"
    ADD CONSTRAINT "KycDocument_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KycReview KycReview_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KycReview"
    ADD CONSTRAINT "KycReview_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kyc Kyc_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kyc"
    ADD CONSTRAINT "Kyc_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LiquidityPool LiquidityPool_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LiquidityPool"
    ADD CONSTRAINT "LiquidityPool_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: LoginHistory LoginHistory_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."LoginHistory"
    ADD CONSTRAINT "LoginHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantAddress MerchantAddress_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantAddress"
    ADD CONSTRAINT "MerchantAddress_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantBranding MerchantBranding_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantBranding"
    ADD CONSTRAINT "MerchantBranding_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantBusinessHours MerchantBusinessHours_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantBusinessHours"
    ADD CONSTRAINT "MerchantBusinessHours_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantCompliance MerchantCompliance_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantCompliance"
    ADD CONSTRAINT "MerchantCompliance_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantContact MerchantContact_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantContact"
    ADD CONSTRAINT "MerchantContact_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantDocument MerchantDocument_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantDocument"
    ADD CONSTRAINT "MerchantDocument_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantFeature MerchantFeature_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantFeature"
    ADD CONSTRAINT "MerchantFeature_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantFee MerchantFee_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantFee"
    ADD CONSTRAINT "MerchantFee_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantLimits MerchantLimits_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantLimits"
    ADD CONSTRAINT "MerchantLimits_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantNotificationSettings MerchantNotificationSettings_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantNotificationSettings"
    ADD CONSTRAINT "MerchantNotificationSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantSecuritySettings MerchantSecuritySettings_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSecuritySettings"
    ADD CONSTRAINT "MerchantSecuritySettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantSettings MerchantSettings_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSettings"
    ADD CONSTRAINT "MerchantSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantSubscription MerchantSubscription_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantSubscription"
    ADD CONSTRAINT "MerchantSubscription_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: MerchantWebhookSettings MerchantWebhookSettings_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MerchantWebhookSettings"
    ADD CONSTRAINT "MerchantWebhookSettings_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: NotificationLog NotificationLog_notificationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NotificationLog"
    ADD CONSTRAINT "NotificationLog_notificationId_fkey" FOREIGN KEY ("notificationId") REFERENCES public."Notification"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Notification Notification_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Notification Notification_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Notification Notification_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: OAuthAccount OAuthAccount_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OAuthAccount"
    ADD CONSTRAINT "OAuthAccount_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PEPCheck PEPCheck_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PEPCheck"
    ADD CONSTRAINT "PEPCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PasswordReset PasswordReset_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PasswordReset"
    ADD CONSTRAINT "PasswordReset_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentAttempt PaymentAttempt_paymentIntentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentAttempt"
    ADD CONSTRAINT "PaymentAttempt_paymentIntentId_fkey" FOREIGN KEY ("paymentIntentId") REFERENCES public."PaymentIntent"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentAttempt PaymentAttempt_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentAttempt"
    ADD CONSTRAINT "PaymentAttempt_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentIntent PaymentIntent_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentIntent"
    ADD CONSTRAINT "PaymentIntent_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentIntent PaymentIntent_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentIntent"
    ADD CONSTRAINT "PaymentIntent_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PaymentIntent PaymentIntent_paymentMethodId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentIntent"
    ADD CONSTRAINT "PaymentIntent_paymentMethodId_fkey" FOREIGN KEY ("paymentMethodId") REFERENCES public."PaymentMethod"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethod PaymentMethod_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethod"
    ADD CONSTRAINT "PaymentMethod_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PaymentMethod PaymentMethod_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PaymentMethod"
    ADD CONSTRAINT "PaymentMethod_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Payroll Payroll_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Payroll Payroll_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payroll"
    ADD CONSTRAINT "Payroll_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Printer Printer_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Printer"
    ADD CONSTRAINT "Printer_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Product Product_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brand"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Product Product_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ProviderResponse ProviderResponse_providerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProviderResponse"
    ADD CONSTRAINT "ProviderResponse_providerId_fkey" FOREIGN KEY ("providerId") REFERENCES public."PaymentProvider"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PurchaseItem PurchaseItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PurchaseItem"
    ADD CONSTRAINT "PurchaseItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: PurchaseItem PurchaseItem_purchaseId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PurchaseItem"
    ADD CONSTRAINT "PurchaseItem_purchaseId_fkey" FOREIGN KEY ("purchaseId") REFERENCES public."Purchase"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Purchase Purchase_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purchase"
    ADD CONSTRAINT "Purchase_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Purchase Purchase_supplierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Purchase"
    ADD CONSTRAINT "Purchase_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES public."Supplier"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ReceiptTemplate ReceiptTemplate_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReceiptTemplate"
    ADD CONSTRAINT "ReceiptTemplate_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RefreshToken RefreshToken_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefreshToken"
    ADD CONSTRAINT "RefreshToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RefundReason RefundReason_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RefundReason"
    ADD CONSTRAINT "RefundReason_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Refund Refund_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Refund"
    ADD CONSTRAINT "Refund_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Refund Refund_refundReasonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Refund"
    ADD CONSTRAINT "Refund_refundReasonId_fkey" FOREIGN KEY ("refundReasonId") REFERENCES public."RefundReason"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Refund Refund_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Refund"
    ADD CONSTRAINT "Refund_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ReportExport ReportExport_reportId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ReportExport"
    ADD CONSTRAINT "ReportExport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES public."Report"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Report Report_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Report_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Reversal Reversal_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Reversal"
    ADD CONSTRAINT "Reversal_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RiskAssessment RiskAssessment_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RiskAssessment"
    ADD CONSTRAINT "RiskAssessment_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RolePermission RolePermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RolePermission RolePermission_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Salary Salary_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Salary"
    ADD CONSTRAINT "Salary_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SanctionCheck SanctionCheck_kycId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SanctionCheck"
    ADD CONSTRAINT "SanctionCheck_kycId_fkey" FOREIGN KEY ("kycId") REFERENCES public."Kyc"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Scanner Scanner_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Scanner"
    ADD CONSTRAINT "Scanner_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SettlementAttempt SettlementAttempt_settlementId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementAttempt"
    ADD CONSTRAINT "SettlementAttempt_settlementId_fkey" FOREIGN KEY ("settlementId") REFERENCES public."Settlement"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SettlementBatch SettlementBatch_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementBatch"
    ADD CONSTRAINT "SettlementBatch_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SettlementFee SettlementFee_settlementId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementFee"
    ADD CONSTRAINT "SettlementFee_settlementId_fkey" FOREIGN KEY ("settlementId") REFERENCES public."Settlement"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SettlementRule SettlementRule_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementRule"
    ADD CONSTRAINT "SettlementRule_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SettlementSchedule SettlementSchedule_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SettlementSchedule"
    ADD CONSTRAINT "SettlementSchedule_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Settlement Settlement_bankAccountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settlement"
    ADD CONSTRAINT "Settlement_bankAccountId_fkey" FOREIGN KEY ("bankAccountId") REFERENCES public."BankAccount"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Settlement Settlement_batchId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settlement"
    ADD CONSTRAINT "Settlement_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES public."SettlementBatch"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Settlement Settlement_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settlement"
    ADD CONSTRAINT "Settlement_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Settlement Settlement_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Settlement"
    ADD CONSTRAINT "Settlement_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Shift Shift_employeeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shift"
    ADD CONSTRAINT "Shift_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public."Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Supplier Supplier_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SystemSetting SystemSetting_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SystemSetting"
    ADD CONSTRAINT "SystemSetting_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalConfiguration TerminalConfiguration_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalConfiguration"
    ADD CONSTRAINT "TerminalConfiguration_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalGroup TerminalGroup_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalGroup"
    ADD CONSTRAINT "TerminalGroup_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalHeartbeat TerminalHeartbeat_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalHeartbeat"
    ADD CONSTRAINT "TerminalHeartbeat_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalKey TerminalKey_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalKey"
    ADD CONSTRAINT "TerminalKey_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalLocation TerminalLocation_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalLocation"
    ADD CONSTRAINT "TerminalLocation_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalLog TerminalLog_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalLog"
    ADD CONSTRAINT "TerminalLog_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TerminalSoftware TerminalSoftware_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TerminalSoftware"
    ADD CONSTRAINT "TerminalSoftware_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Terminal Terminal_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terminal"
    ADD CONSTRAINT "Terminal_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Terminal Terminal_terminalGroupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terminal"
    ADD CONSTRAINT "Terminal_terminalGroupId_fkey" FOREIGN KEY ("terminalGroupId") REFERENCES public."TerminalGroup"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: TransactionDiscount TransactionDiscount_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionDiscount"
    ADD CONSTRAINT "TransactionDiscount_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionEvent TransactionEvent_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionEvent"
    ADD CONSTRAINT "TransactionEvent_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionFee TransactionFee_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionFee"
    ADD CONSTRAINT "TransactionFee_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionFee TransactionFee_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionFee"
    ADD CONSTRAINT "TransactionFee_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: TransactionItem TransactionItem_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionItem"
    ADD CONSTRAINT "TransactionItem_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: TransactionItem TransactionItem_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionItem"
    ADD CONSTRAINT "TransactionItem_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionMetadata TransactionMetadata_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionMetadata"
    ADD CONSTRAINT "TransactionMetadata_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionStatusHistory TransactionStatusHistory_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionStatusHistory"
    ADD CONSTRAINT "TransactionStatusHistory_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionTax TransactionTax_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionTax"
    ADD CONSTRAINT "TransactionTax_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TransactionTimeline TransactionTimeline_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransactionTimeline"
    ADD CONSTRAINT "TransactionTimeline_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_blockchainTransactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_blockchainTransactionId_fkey" FOREIGN KEY ("blockchainTransactionId") REFERENCES public."BlockchainTransaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transaction Transaction_cryptoConversionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_cryptoConversionId_fkey" FOREIGN KEY ("cryptoConversionId") REFERENCES public."CryptoConversion"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transaction Transaction_customerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transaction Transaction_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Transaction Transaction_paymentIntentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_paymentIntentId_fkey" FOREIGN KEY ("paymentIntentId") REFERENCES public."PaymentIntent"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transaction Transaction_terminalId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_terminalId_fkey" FOREIGN KEY ("terminalId") REFERENCES public."Terminal"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Transaction Transaction_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transaction"
    ADD CONSTRAINT "Transaction_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: UserPermission UserPermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserPermission UserPermission_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserPermission"
    ADD CONSTRAINT "UserPermission_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User User_assignedRoleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_assignedRoleId_fkey" FOREIGN KEY ("assignedRoleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: User User_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: VoidTransaction VoidTransaction_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VoidTransaction"
    ADD CONSTRAINT "VoidTransaction_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletAddress WalletAddress_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletAddress"
    ADD CONSTRAINT "WalletAddress_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletAddress WalletAddress_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletAddress"
    ADD CONSTRAINT "WalletAddress_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletAudit WalletAudit_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletAudit"
    ADD CONSTRAINT "WalletAudit_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletBalance WalletBalance_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletBalance"
    ADD CONSTRAINT "WalletBalance_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletKey WalletKey_walletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletKey"
    ADD CONSTRAINT "WalletKey_walletId_fkey" FOREIGN KEY ("walletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletTransfer WalletTransfer_blockchainTxId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_blockchainTxId_fkey" FOREIGN KEY ("blockchainTxId") REFERENCES public."BlockchainTransaction"("txHash") ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: WalletTransfer WalletTransfer_cryptoConversionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_cryptoConversionId_fkey" FOREIGN KEY ("cryptoConversionId") REFERENCES public."CryptoConversion"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: WalletTransfer WalletTransfer_fromWalletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_fromWalletId_fkey" FOREIGN KEY ("fromWalletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletTransfer WalletTransfer_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WalletTransfer WalletTransfer_refundId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_refundId_fkey" FOREIGN KEY ("refundId") REFERENCES public."Refund"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: WalletTransfer WalletTransfer_toWalletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WalletTransfer"
    ADD CONSTRAINT "WalletTransfer_toWalletId_fkey" FOREIGN KEY ("toWalletId") REFERENCES public."Wallet"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Wallet Wallet_bankAccountId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT "Wallet_bankAccountId_fkey" FOREIGN KEY ("bankAccountId") REFERENCES public."BankAccount"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Wallet Wallet_blockchainId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT "Wallet_blockchainId_fkey" FOREIGN KEY ("blockchainId") REFERENCES public."BlockchainNetwork"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Wallet Wallet_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wallet"
    ADD CONSTRAINT "Wallet_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WebhookDelivery WebhookDelivery_transactionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookDelivery"
    ADD CONSTRAINT "WebhookDelivery_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES public."Transaction"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: WebhookDelivery WebhookDelivery_webhookId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookDelivery"
    ADD CONSTRAINT "WebhookDelivery_webhookId_fkey" FOREIGN KEY ("webhookId") REFERENCES public."Webhook"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WebhookEvent WebhookEvent_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookEvent"
    ADD CONSTRAINT "WebhookEvent_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: WebhookRetry WebhookRetry_webhookDeliveryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WebhookRetry"
    ADD CONSTRAINT "WebhookRetry_webhookDeliveryId_fkey" FOREIGN KEY ("webhookDeliveryId") REFERENCES public."WebhookDelivery"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Webhook Webhook_merchantId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Webhook"
    ADD CONSTRAINT "Webhook_merchantId_fkey" FOREIGN KEY ("merchantId") REFERENCES public."Merchant"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict zezeK7tXEHH8aavVLwMWJCKYc6LGQu6bIHJyKkTNJjmFRKo1TYMEXYQCX6Q63qY

