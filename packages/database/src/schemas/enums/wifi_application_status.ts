import { pgEnum } from "drizzle-orm/pg-core";

export const wifi_application_status = pgEnum("wifi_application_status", [
  //   "0.サービス不要",
  //   "1.未対応",
  //   "2.申込フォーム入力完了",
  //   "2.application_form_failed 申込フォーム入力失敗",
  //   "3.在留カードの裏に住所記載なし",
  //   "4.対応済み",
  //   "5.契約済み - 開通前",
  //   "6.契約済み - 開通済み",
  //   "7.その他",
  //   "8.申込取り消し",
  "service_not_required",
  "not_handle",
  "application_form_completed",
  "application_form_failed",
  "no_address_on_residence_card",
  "handled",
  "contracted_before_activation",
  "contracted_activated",
  "other",
  "application_cancelled",
]);
