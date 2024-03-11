ALTER TABLE "order_state" ADD COLUMN "is_recieved" text;--> statement-breakpoint
ALTER TABLE "order_detail" ADD CONSTRAINT "order_detail_order_number_unique" UNIQUE("order_number");