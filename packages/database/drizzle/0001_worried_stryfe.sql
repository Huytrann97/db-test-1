CREATE TABLE IF NOT EXISTS "logs" (
	"id" serial PRIMARY KEY NOT NULL,
	"action" text,
	"sub_system" text,
	"user_email" text,
	"object" json,
	"data" json,
	"ip_address" text,
	"user_agent" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
ALTER TABLE "agency_accounts" ADD COLUMN "is_representative" boolean DEFAULT false NOT NULL;
--> statement-breakpoint
CREATE UNIQUE INDEX ON "agency_accounts" (agency_id, is_representative) where is_representative = true;