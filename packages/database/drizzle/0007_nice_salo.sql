DO $$ BEGIN
 CREATE TYPE "currently_gtn_services" AS ENUM('mobile', 'rent_guarantor', 'assistants', 'real_estate_agent', 'specified_skilled_worker_program');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "credit_card_applications" ADD COLUMN "currently_gtn_services" currently_gtn_services[] NOT NULL;