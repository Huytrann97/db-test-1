ALTER TABLE "agency_accounts" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "bank_accounts" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "gtn_in_charges" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "agencies" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "addresses" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "applicants" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "correspondences" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "credit_card_applications" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "applications" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "utility_applications" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "utility_companies" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "wifi_applications" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "billings" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "earnings" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "gtn_members" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "logs" DROP COLUMN IF EXISTS "updated_at";--> statement-breakpoint
ALTER TABLE "user_tokens" DROP COLUMN IF EXISTS "updated_at";