import { relations } from "drizzle-orm";
import { pgTable, text, integer } from "drizzle-orm/pg-core";

import { base_schema_columns } from "@/schemas/base_schemas";
import { prefecture } from "@/enums/prefecture";

import { applicants } from "./index";

export const addresses = pgTable("addresses", {
  applicantId: integer("applicant_id")
    .primaryKey()
    .references(() => applicants.id, { onDelete: "cascade" }),
  postalCode: text("postal_code").notNull(),
  prefecture: prefecture("prefecture").notNull(),
  city: text("city").notNull(),
  addressDetail: text("address_detail").notNull(),
  building: text("building"),
  roomNumber: text("room_number"),
  ...base_schema_columns,
});

export const addresses_relations = relations(addresses, ({ one }) => ({
  applicant: one(applicants, {
    fields: [addresses.applicantId],
    references: [applicants.id],
  }),
}));
