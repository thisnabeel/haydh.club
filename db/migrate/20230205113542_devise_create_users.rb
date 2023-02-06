# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",         null: false
    t.string   "encrypted_password",                default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "code"
    t.string   "fingerprint"
    t.string   "placeholder_key"
    t.boolean   "period",                            default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider",                          default: "email",    null: false
    t.string   "uid",                               default: "",         null: false
    t.json     "tokens"
    t.string   "authentication_token",   limit: 30
  end
end
