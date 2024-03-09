import { pgTable, integer, primaryKey } from "drizzle-orm/pg-core";
import { relations } from "drizzle-orm";

import { base_schema_columns } from "@/schemas/base_schemas";
import { gtn_members } from "@/schemas/gtn_members";

import { agencies } from "./index";

export const gtn_in_charges = pgTable(
  "gtn_in_charges",
  {
    agencyId: integer("agency_id")
      .notNull()
      .references(() => agencies.id, { onDelete: "cascade" }),
    gtnMemberId: integer("gtn_member_id")
      .notNull()
      .references(() => gtn_members.id, { onDelete: "cascade" }),
    ...base_schema_columns,
  },
  (table) => {
    return {
      pk: primaryKey(table.gtnMemberId, table.agencyId),
    };
  }
);

export const gtn_in_charges_relations = relations(
  gtn_in_charges,
  ({ one }) => ({
    gtnMember: one(gtn_members, {
      fields: [gtn_in_charges.gtnMemberId],
      references: [gtn_members.id],
    }),
    agency: one(agencies, {
      fields: [gtn_in_charges.agencyId],
      references: [agencies.id],
    }),
  })
);
