import { pgEnum } from "drizzle-orm/pg-core";

export const utility_application_status = pgEnum("utility_application_status", [
  //   "0.サービス不要",
  //   "1.未対応",
  //   "2.規約同意メール送信 - 未同意",
  //   "agreement_email_sent_failed 規約同意メール送信失敗",
  //   "3.申込フォーム入力完了",
  //   "application_form_failed 申込フォーム入力失敗",
  //   "4.契約済み - 開通前",
  //   "5.契約済み - 開通済み",
  //   "6.その他",
  //   "7.申込取り消し",
  "service_not_required",
  "not_handle",
  "agreement_email_sent_not_agreed",
  "agreement_email_sent_failed",
  "application_form_completed",
  "application_form_failed",
  "contracted_before_activation",
  "contracted_activated",
  "other",
  "application_cancelled",
]);
