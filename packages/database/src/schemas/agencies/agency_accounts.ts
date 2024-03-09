import { relations } from "drizzle-orm";
import {
  boolean,
  integer,
  pgTable,
  serial,
  text,
  unique,
} from "drizzle-orm/pg-core";

import { base_schema_columns } from "@/schemas/base_schemas";
import { user_tokens } from "@/schemas/user_tokens";

import { agencies } from "./index";

export const agency_accounts = pgTable("agency_accounts", {
  id: serial("id").primaryKey(),
  agencyId: integer("agency_id")
    .notNull()
    .references(() => agencies.id, { onDelete: "cascade" }),
  email: text("email").notNull().unique(),
  hash: text("hash").notNull(),
  firstName: text("first_name").notNull(),
  lastName: text("last_name"),
  firstNameKana: text("first_name_kana"),
  lastNameKana: text("last_name_kana"),
  phoneNumber: text("phone_number"),
  department: text("department"),
  isRepresentative: boolean("is_representative").notNull().default(false),
  ...base_schema_columns,
});

export const agency_accounts_relations = relations(
  agency_accounts,
  ({ one, many }) => ({
    agency: one(agencies, {
      fields: [agency_accounts.agencyId],
      references: [agencies.id],
    }),
    tokens: many(user_tokens),
  })
);
