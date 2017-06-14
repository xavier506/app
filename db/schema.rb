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

ActiveRecord::Schema.define(version: 20170614202821) do

  create_table "bill_of_lading_containers", force: :cascade do |t|
    t.integer  "bill_of_lading_id"
    t.integer  "container_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["bill_of_lading_id"], name: "index_bill_of_lading_containers_on_bill_of_lading_id"
    t.index ["container_id"], name: "index_bill_of_lading_containers_on_container_id"
  end

  create_table "bill_of_ladings", force: :cascade do |t|
    t.string   "document_number"
    t.string   "liner"
    t.text     "receiver"
    t.text     "notify"
    t.text     "also_notify"
    t.text     "exporter"
    t.text     "export_references"
    t.text     "forwarding_agent_references"
    t.string   "place_of_origin"
    t.string   "place_of_reciept"
    t.string   "place_of_delivery"
    t.date     "date_of_reciept"
    t.string   "precarriage"
    t.string   "ocean_vessel"
    t.string   "loading_port"
    t.string   "discharge_port"
    t.text     "instructions"
    t.text     "description"
    t.string   "freight_charges"
    t.string   "revenue_tons"
    t.string   "rate"
    t.string   "prepaid"
    t.string   "collect"
    t.string   "original_number"
    t.string   "prepaid_at"
    t.string   "collect_at"
    t.string   "place_of_issue"
    t.date     "issue_date"
    t.decimal  "exchange_rate_1"
    t.decimal  "exchange_rate_2"
    t.string   "service_type"
    t.string   "laden_on_board"
    t.integer  "rider_pages"
    t.decimal  "total_cmb"
    t.decimal  "verfified_gross_mass"
    t.integer  "order_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "unit_type"
    t.decimal  "total_units"
    t.decimal  "total_weight"
    t.decimal  "total_volume"
    t.index ["order_id"], name: "index_bill_of_ladings_on_order_id"
  end

  create_table "certificate_containers", force: :cascade do |t|
    t.integer  "certificate_id"
    t.integer  "container_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["certificate_id"], name: "index_certificate_containers_on_certificate_id"
    t.index ["container_id"], name: "index_certificate_containers_on_container_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.text     "shipper"
    t.text     "receiver"
    t.text     "farm"
    t.string   "mode"
    t.text     "notify"
    t.string   "country"
    t.string   "discharge_port"
    t.string   "departure_port"
    t.text     "observations"
    t.integer  "units"
    t.string   "unit_type"
    t.text     "description"
    t.decimal  "volume"
    t.decimal  "gross_weight"
    t.text     "invoices"
    t.integer  "order_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["order_id"], name: "index_certificates_on_order_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "company"
    t.string   "email"
    t.string   "telephone"
    t.string   "contact_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "consignees", force: :cascade do |t|
    t.string   "company"
    t.string   "email"
    t.string   "telephone"
    t.string   "contact_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "containers", force: :cascade do |t|
    t.string   "shipper_seal"
    t.string   "carrier_seal"
    t.string   "container_number"
    t.string   "container_type"
    t.string   "booking_number"
    t.string   "liner"
    t.date     "gate_in"
    t.date     "gate_out"
    t.string   "tir"
    t.string   "vessel"
    t.string   "client"
    t.string   "license_plate"
    t.string   "chasis"
    t.integer  "units"
    t.string   "unit_type"
    t.decimal  "volume"
    t.decimal  "tare_weight"
    t.decimal  "gross_weight"
    t.decimal  "truck_tare"
    t.decimal  "payload"
    t.date     "treatment_date"
    t.string   "fumigation_doc"
    t.string   "fumigation_seal"
    t.string   "inspector"
    t.text     "description"
    t.string   "farm"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_containers_on_order_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "company"
    t.string   "email"
    t.string   "telephone"
    t.string   "contact_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.text     "notes"
    t.string   "status"
    t.string   "mode"
    t.string   "booking_number"
    t.string   "liner"
    t.string   "vessel"
    t.date     "vessel_departure"
    t.date     "cutoff"
    t.string   "dua"
    t.string   "fad"
    t.string   "customer_invoice"
    t.string   "weight_units"
    t.string   "volume_units"
    t.integer  "client_id"
    t.integer  "consignee_id"
    t.integer  "notification_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "customer_ref"
    t.string   "pca_invoice_number"
    t.string   "pca_invoice_url"
    t.string   "place_of_delivery"
    t.date     "eta_date"
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["consignee_id"], name: "index_orders_on_consignee_id"
    t.index ["notification_id"], name: "index_orders_on_notification_id"
  end

  create_table "phytosanitaries", force: :cascade do |t|
    t.integer  "number"
    t.text     "exporter"
    t.text     "receiver"
    t.text     "notify"
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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "full_name"
    t.integer  "client_id"
    t.integer  "notification_id"
    t.integer  "consignee_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "user_type"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["consignee_id"], name: "index_users_on_consignee_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["notification_id"], name: "index_users_on_notification_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
