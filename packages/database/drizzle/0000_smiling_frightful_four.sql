DO $$ BEGIN
 CREATE TYPE "bank_classification" AS ENUM('savings', 'checking', 'deposit');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "contact_day_of_weeks" AS ENUM('monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "correspondence_destination_type" AS ENUM('affiliate', 'mobile', 'credit_card', 'agency', 'utility_company');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "credit_card_application_status" AS ENUM('service_not_required', 'not_handle', 'in_progress', 'informed_url_sent', 'informed_cannot_guide', 'informed_gtn_service_not_used', 'informed_no_reply', 'informed_duplicate_application', 'spam_post', 'passed_to_another_department', 'issued', 'issue_declined', 'issue_cancelled', 'other', 'application_cancelled');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "gas_start_time_type" AS ENUM('9am-12pm', '1pm-3pm', '3pm-5pm', '5pm-7pm');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "language" AS ENUM('japanese', 'vietnamese', 'chinese', 'english', 'korean', 'taiwan');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "prefecture" AS ENUM('北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '岡山県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "service_type" AS ENUM('wifi', 'utility', 'credit_card');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "site" AS ENUM('gtn_admin', 'agency', 'utilities');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "utility_application_status" AS ENUM('service_not_required', 'not_handle', 'agreement_email_sent_not_agreed', 'agreement_email_sent_failed', 'application_form_completed', 'application_form_failed', 'contracted_before_activation', 'contracted_activated', 'other', 'application_cancelled');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "utility_contract_type" AS ENUM('electric', 'water_supply', 'gas', 'no_contract');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "utility_type" AS ENUM('both', 'electric', 'gas');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "visa_category" AS ENUM('留学', '人文知識・国際業務', '技能実習', '特定活動', '永住者', '定住者', '家族滞在', '特定技能', '技能', '企業内転勤', '技術', '文化活動', '日本人の配偶者等', '永住者の配偶者等', '教授', '教育', '高度専門職', '介護', '興行', '宗教', '投資・経営', '短期滞在', '公用', '研修', '研究', '外交', '報道', '芸術', 'その他');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "wifi_application_status" AS ENUM('service_not_required', 'not_handle', 'application_form_completed', 'application_form_failed', 'no_address_on_residence_card', 'handled', 'contracted_before_activation', 'contracted_activated', 'other', 'application_cancelled');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "agency_accounts" (
	"id" serial PRIMARY KEY NOT NULL,
	"agency_id" integer NOT NULL,
	"email" text NOT NULL,
	"hash" text NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text,
	"first_name_kana" text,
	"last_name_kana" text,
	"phone_number" text,
	"department" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "bank_accounts" (
	"id" serial PRIMARY KEY NOT NULL,
	"agency_id" integer NOT NULL,
	"bank_name" text NOT NULL,
	"branch" text NOT NULL,
	"account_number" text NOT NULL,
	"account_name" text NOT NULL,
	"classification" "bank_classification" NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "gtn_in_charges" (
	"agency_id" integer NOT NULL,
	"gtn_member_id" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT gtn_in_charges_gtn_member_id_agency_id PRIMARY KEY("gtn_member_id","agency_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "agencies" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"name_kana" text,
	"phone_number" text,
	"email" text,
	"zip_code" text,
	"prefecture" "prefecture",
	"city" text,
	"address_detail" text,
	"building" text,
	"room_number" text,
	"anti_social_check" boolean DEFAULT false,
	"invoice_number" text,
	"service_type_codes" service_type[],
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "addresses" (
	"applicant_id" integer PRIMARY KEY NOT NULL,
	"postal_code" text NOT NULL,
	"prefecture" "prefecture" NOT NULL,
	"city" text NOT NULL,
	"address_detail" text NOT NULL,
	"building" text,
	"room_number" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "applicants" (
	"id" serial PRIMARY KEY NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"first_name_kana" text NOT NULL,
	"last_name_kana" text NOT NULL,
	"birthdate" date NOT NULL,
	"nationality" text NOT NULL,
	"visa_classification" "visa_category" NOT NULL,
	"desired_language_code" "language" NOT NULL,
	"phone_number" text NOT NULL,
	"email" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "correspondences" (
	"id" serial PRIMARY KEY NOT NULL,
	"application_id" integer NOT NULL,
	"destination_type_code" "correspondence_destination_type" NOT NULL,
	"date" timestamp NOT NULL,
	"message" text NOT NULL,
	"email_sent_at" timestamp,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "credit_card_applications" (
	"application_id" integer PRIMARY KEY NOT NULL,
	"status" "credit_card_application_status" DEFAULT 'not_handle' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "applications" (
	"id" serial PRIMARY KEY NOT NULL,
	"agency_id" integer NOT NULL,
	"applicant_id" integer NOT NULL,
	"service_type_codes" service_type[] NOT NULL,
	"complete_at" timestamp,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "utility_applications" (
	"application_id" integer PRIMARY KEY NOT NULL,
	"utility_company_id" integer NOT NULL,
	"utility_type_code" "utility_type" NOT NULL,
	"current_contract_type_codes" utility_contract_type[],
	"electric_start_date" date,
	"gas_start_date" date,
	"gas_start_time_code" "gas_start_time_type",
	"with_water_supply" boolean NOT NULL,
	"status" "utility_application_status" DEFAULT 'not_handle' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "utility_companies" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"email" text,
	"both_commission_pay" integer,
	"both_commission_receive" integer,
	"electric_commission_pay" integer,
	"electric_commission_receive" integer,
	"gas_commission_pay" integer,
	"gas_commission_receive" integer,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "wifi_applications" (
	"application_id" integer PRIMARY KEY NOT NULL,
	"contact_day_of_weeks" "contact_day_of_weeks" NOT NULL,
	"visa_front_url" text NOT NULL,
	"visa_back_url" text NOT NULL,
	"visa_name" text NOT NULL,
	"visa_exp_date" date NOT NULL,
	"status" "wifi_application_status" DEFAULT 'not_handle' NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "billings" (
	"id" serial PRIMARY KEY NOT NULL,
	"gas_count" integer,
	"electric_count" integer,
	"both_count" integer,
	"agency_id" integer NOT NULL,
	"month" text NOT NULL,
	"amount" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "billings_id_unique" UNIQUE("id"),
	CONSTRAINT "unique_agency_monthly_billing" UNIQUE("agency_id","month")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "earnings" (
	"id" serial PRIMARY KEY NOT NULL,
	"gas_count" integer,
	"electric_count" integer,
	"both_count" integer,
	"agency_id" integer NOT NULL,
	"month" text NOT NULL,
	"amount" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "earnings_id_unique" UNIQUE("id"),
	CONSTRAINT "unique_agency_monthly_earning" UNIQUE("agency_id","month")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "gtn_members" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"department" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user_tokens" (
	"id" serial PRIMARY KEY NOT NULL,
	"agency_account_id" integer,
	"email" text NOT NULL,
	"site_code" "site" NOT NULL,
	"token" text NOT NULL,
	"expired_at" timestamp,
	"login_at" timestamp,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "credit_card_application_id_idx" ON "credit_card_applications" ("application_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "utility_application_id_idx" ON "utility_applications" ("application_id");--> statement-breakpoint
CREATE INDEX IF NOT EXISTS "wifi_application_id_idx" ON "wifi_applications" ("application_id");--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "agency_accounts" ADD CONSTRAINT "agency_accounts_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "gtn_in_charges" ADD CONSTRAINT "gtn_in_charges_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "gtn_in_charges" ADD CONSTRAINT "gtn_in_charges_gtn_member_id_gtn_members_id_fk" FOREIGN KEY ("gtn_member_id") REFERENCES "gtn_members"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "addresses" ADD CONSTRAINT "addresses_applicant_id_applicants_id_fk" FOREIGN KEY ("applicant_id") REFERENCES "applicants"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "correspondences" ADD CONSTRAINT "correspondences_application_id_applications_id_fk" FOREIGN KEY ("application_id") REFERENCES "applications"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "credit_card_applications" ADD CONSTRAINT "credit_card_applications_application_id_applications_id_fk" FOREIGN KEY ("application_id") REFERENCES "applications"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "applications" ADD CONSTRAINT "applications_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "applications" ADD CONSTRAINT "applications_applicant_id_applicants_id_fk" FOREIGN KEY ("applicant_id") REFERENCES "applicants"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "utility_applications" ADD CONSTRAINT "utility_applications_application_id_applications_id_fk" FOREIGN KEY ("application_id") REFERENCES "applications"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "utility_applications" ADD CONSTRAINT "utility_applications_utility_company_id_utility_companies_id_fk" FOREIGN KEY ("utility_company_id") REFERENCES "utility_companies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "wifi_applications" ADD CONSTRAINT "wifi_applications_application_id_applications_id_fk" FOREIGN KEY ("application_id") REFERENCES "applications"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "billings" ADD CONSTRAINT "billings_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "earnings" ADD CONSTRAINT "earnings_agency_id_agencies_id_fk" FOREIGN KEY ("agency_id") REFERENCES "agencies"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_tokens" ADD CONSTRAINT "user_tokens_agency_account_id_agency_accounts_id_fk" FOREIGN KEY ("agency_account_id") REFERENCES "agency_accounts"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
