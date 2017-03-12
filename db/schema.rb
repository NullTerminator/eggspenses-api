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

ActiveRecord::Schema.define(version: 20170311203012) do

  create_table "assets", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.string   "period"
    t.string   "expensable_type"
    t.integer  "expensable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["expensable_type", "expensable_id"], name: "index_expenses_on_expensable_type_and_expensable_id"
  end

  create_table "productions", force: :cascade do |t|
    t.integer  "count"
    t.date     "date"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_productions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_products_on_asset_id"
  end

  create_table "sale_items", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "product_count"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["product_id"], name: "index_sale_items_on_product_id"
  end

end
