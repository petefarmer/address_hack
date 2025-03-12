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

ActiveRecord::Schema[8.0].define(version: 2025_03_12_200620) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contact_person"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_key", null: false
    t.text "description"
    t.string "upc_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "manufacturer"
    t.string "manufacturer_part_number"
    t.string "stock_unit"
    t.integer "minimum_stock"
    t.boolean "serial_tracked"
    t.boolean "lot_tracked"
    t.string "item_type"
    t.string "item_subtype"
    t.string "order_method"
    t.string "price_group"
    t.string "product_key"
    t.string "commodity_key"
    t.string "abc_key"
    t.string "eccn_code"
    t.integer "physical_count_days"
    t.string "manufacturer_code"
    t.boolean "purchasable", default: false, null: false
    t.boolean "saleable", default: false, null: false
    t.string "purchase_unit", default: "kg"
    t.string "sales_unit", default: "kg"
    t.string "production_unit", default: "kg"
    t.string "track_serial_lot"
    t.string "auto_lot_issue_method"
    t.decimal "default_lot_size"
    t.string "storage_condition"
    t.index ["item_key"], name: "index_items_on_item_key", unique: true
    t.index ["upc_key"], name: "index_items_on_upc_key", unique: true
  end
end
