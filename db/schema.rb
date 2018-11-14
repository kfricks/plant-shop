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

ActiveRecord::Schema.define(version: 2018_11_14_192933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "plant_types", force: :cascade do |t|
    t.string "scientific_name"
    t.string "common_name"
    t.string "family"
    t.string "duration"
    t.string "growth_habit"
    t.string "growth_period"
    t.string "growth_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scientific_name", "common_name"], name: "index_plant_types_on_scientific_name_and_common_name"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plant_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_plants_on_deleted_at"
    t.index ["user_id", "plant_type_id", "description"], name: "index_plants_on_user_id_and_plant_type_id_and_description"
  end

  create_table "trade_components", force: :cascade do |t|
    t.integer "trade_id"
    t.integer "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_id", "plant_id"], name: "index_trade_components_on_trade_id_and_plant_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
    t.string "shipping_label_user_a"
    t.string "shipping_label_user_b"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved_by_user_a", default: false, null: false
    t.boolean "approved_by_user_b", default: false, null: false
    t.index ["user_a_id", "user_b_id", "status"], name: "index_trades_on_user_a_id_and_user_b_id_and_status"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "locale"
    t.text "bio"
    t.string "street1"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name", "bio", "city", "state", "locale"], name: "index_users_on_first_name_and_bio_and_city_and_state_and_locale"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
