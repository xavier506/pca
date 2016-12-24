# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161223172056) do

  create_table "certificates", force: :cascade do |t|
    t.text     "shipper"
    t.text     "consignee"
    t.text     "farm"
    t.string   "mode"
    t.integer  "order_id"
    t.integer  "notification_id"
    t.string   "country"
    t.string   "discharge_port"
    t.string   "departure_port"
    t.text     "observations"
    t.integer  "units"
    t.string   "unit_type"
    t.text     "description"
    t.decimal  "volume"
    t.string   "volume_units"
    t.decimal  "gross_weight"
    t.string   "weight_units"
    t.text     "invoices"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["notification_id"], name: "index_certificates_on_notification_id"
    t.index ["order_id"], name: "index_certificates_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "company"
    t.string   "email"
    t.string   "telephone"
    t.string   "contact_name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.text     "notes"
    t.string   "status"
    t.string   "mode"
    t.string   "co_ids"
    t.string   "bl_ids"
    t.string   "ps_ids"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "phytosanitaries", force: :cascade do |t|
    t.integer  "number"
    t.text     "exporter"
    t.text     "consignee"
    t.string   "organization"
    t.string   "place_of_origin"
    t.string   "point_of_entry"
    t.string   "point_of_exit"
    t.string   "mode"
    t.text     "description"
    t.text     "additional_declaration"
    t.string   "place_of_issue"
    t.date     "issue_date"
    t.date     "treatment_date"
    t.string   "treatment"
    t.string   "active_ingredient"
    t.string   "concentration"
    t.string   "duration_temperature"
    t.string   "responsible"
    t.string   "inspector"
    t.integer  "order_id"
    t.integer  "notification_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["notification_id"], name: "index_phytosanitaries_on_notification_id"
    t.index ["order_id"], name: "index_phytosanitaries_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
