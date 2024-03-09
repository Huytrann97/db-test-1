import { relations } from "drizzle-orm";
import { boolean, pgTable, serial, text, unique } from "drizzle-orm/pg-core";

import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";
import { service_type } from "@/enums/service_type";
import { prefecture } from "@/enums/prefecture";

import { agency_accounts } from "./agency_accounts";
import { bank_accounts } from "./bank_accounts";
import { gtn_in_charges } from "./gtn_in_charges";

export const agencies = pgTable("agencies", {
  id: serial("id").primaryKey(),
  name: text("name").notNull(),
  nameKana: text("name_kana"),
  phoneNumber: text("phone_number"),
  email: text("email").notNull().unique(),
  zipCode: text("zip_code"),
  prefecture: prefecture("prefecture"),
  city: text("city"),
  addressDetail: text("address_detail"),
  building: text("building"),
  roomNumber: text("room_number"),
  antiSocialCheck: boolean("anti_social_check").default(false),
  invoiceNumber: text("invoice_number"),
  serviceTypeCodes: service_type("service_type_codes").array(),
  ...base_schema_columns,
});

export const agencies_relations = relations(agencies, ({ one, many }) => ({
  accounts: many(agency_accounts),
  applications: many(applications),
  bankAccount: one(bank_accounts, {
    fields: [agencies.id],
    references: [bank_accounts.agencyId],
  }),
  gtnInCharges: many(gtn_in_charges),
}));
