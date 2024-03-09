ALTER TABLE "agency_accounts" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "bank_accounts" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "gtn_in_charges" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "agencies" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "addresses" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "applicants" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "correspondences" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "credit_card_applications" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "applications" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "utility_applications" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "utility_companies" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "wifi_applications" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "billings" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "earnings" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "gtn_members" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "logs" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "user_tokens" ADD COLUMN "updated_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint

-- Inserted manually
CREATE OR REPLACE FUNCTION set_updated_at()
    RETURNS TRIGGER AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "agency_accounts"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "bank_accounts"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "gtn_in_charges"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "agencies"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "addresses"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "applicants"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "correspondences"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "credit_card_applications"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "applications"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "utility_applications"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "utility_companies"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "wifi_applications"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "billings"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "earnings"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "gtn_members"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "logs"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();
--> statement-breakpoint
CREATE TRIGGER set_updated_at
BEFORE UPDATE ON "user_tokens"
FOR EACH ROW
EXECUTE PROCEDURE set_updated_at();