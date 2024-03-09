ALTER TABLE "agency_accounts" ADD CONSTRAINT "agency_accounts_email_unique" UNIQUE("email");--> statement-breakpoint
ALTER TABLE "agencies" ADD CONSTRAINT "agencies_email_unique" UNIQUE("email");