# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_04_032359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "phones_gender", ["home", "mobile", "whatsapp", "work", "other"]
  create_enum "real_estates_available_for", ["rent", "sale"]
  create_enum "real_estates_furnished_level", ["fully_furnished", "partially_furnished", "unfurnished"]
  create_enum "real_estates_status", ["available", "rented", "saled"]
  create_enum "rentals_status", ["reserve", "ongoing", "ended"]
  create_enum "rooms_gender", ["bedroom", "bathroom", "livingroom", "kitchen", "garden", "diningroom"]
  create_enum "users_gender", ["male", "female"]
  create_enum "users_role", ["admin", "user"]

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "postal_code"
    t.float "latitude"
    t.float "longitude"
    t.string "street"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "country_code"
    t.string "state_code"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.index ["code"], name: "index_amenities_on_code", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.text "message"
    t.integer "priority"
    t.text "link"
    t.string "type"
    t.string "status"
    t.datetime "read_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "country_code"
    t.string "phone_number"
    t.enum "gender", enum_type: "phones_gender"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "real_estates", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price_per_month"
    t.float "size"
    t.date "build_date"
    t.boolean "furnished", default: false, null: false
    t.enum "status", default: "available", null: false, enum_type: "real_estates_status"
    t.enum "available_for", default: "rent", null: false, enum_type: "real_estates_available_for"
    t.enum "furnished_level", default: "unfurnished", null: false, enum_type: "real_estates_furnished_level"
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_real_estates_on_owner_id"
  end

  create_table "real_estates_amenities", force: :cascade do |t|
    t.bigint "amenity_id", null: false
    t.bigint "real_estate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_real_estates_amenities_on_amenity_id"
    t.index ["real_estate_id"], name: "index_real_estates_amenities_on_real_estate_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.float "total_price"
    t.datetime "start_date"
    t.integer "months"
    t.datetime "end_date"
    t.enum "status", default: "reserve", null: false, enum_type: "rentals_status"
    t.bigint "real_estate_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_estate_id"], name: "index_rentals_on_real_estate_id"
    t.index ["tenant_id"], name: "index_rentals_on_tenant_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.float "size"
    t.enum "gender", default: "bedroom", null: false, enum_type: "rooms_gender"
    t.string "description"
    t.bigint "real_estate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_estate_id"], name: "index_rooms_on_real_estate_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "request"
    t.integer "results_count"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.date "birthday"
    t.enum "role", default: "user", null: false, enum_type: "users_role"
    t.enum "gender", enum_type: "users_gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "notifications", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "real_estates", "users", column: "owner_id"
  add_foreign_key "real_estates_amenities", "amenities"
  add_foreign_key "real_estates_amenities", "real_estates"
  add_foreign_key "rentals", "real_estates"
  add_foreign_key "rentals", "users", column: "tenant_id"
  add_foreign_key "rooms", "real_estates"
  add_foreign_key "searches", "users"
end
