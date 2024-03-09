import { relations } from "drizzle-orm";
import { pgTable, serial, text, date } from "drizzle-orm/pg-core";

import { language } from "@/enums/language";
import { visa_category } from "@/enums/visa_category";
import { applications } from "@/schemas/applications";
import { base_schema_columns } from "@/schemas/base_schemas";

import { addresses } from "./addresses";

export const applicants = pgTable("applicants", {
  id: serial("id").primaryKey(),
  firstName: text("first_name").notNull(),
  lastName: text("last_name").notNull(),
  firstNameKana: text("first_name_kana").notNull(),
  lastNameKana: text("last_name_kana").notNull(),
  birthdate: date("birthdate").notNull(),
  nationality: text("nationality").notNull(),
  visaClassification: visa_category("visa_classification").notNull(),
  desiredLanguageCode: language("desired_language_code").notNull(),
  phoneNumber: text("phone_number").notNull(),
  email: text("email").notNull(),
  ...base_schema_columns,
});

export const applicants_relations = relations(applicants, ({ one }) => ({
  application: one(applications, {
    fields: [applicants.id],
    references: [applications.applicantId],
  }),
  address: one(addresses, {
    fields: [applicants.id],
    references: [addresses.applicantId],
  }),
}));
