import { pgEnum } from "drizzle-orm/pg-core";

export const correspondence_destination_type = pgEnum(
  "correspondence_destination_type",
  [
    // "GTNアフィリエイトaffiliate",
    // "GTNモバイルmobile",
    // "GTNカードcredit_card",
    // "代理店agency",
    // "供給会社utility_company",
    "affiliate",
    "mobile",
    "credit_card",
    "agency",
    "utility_company",
  ]
);
