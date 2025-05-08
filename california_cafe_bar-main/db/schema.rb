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

ActiveRecord::Schema[7.1].define(version: 2024_11_19_233655) do
  create_table "beehive_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_id"
    t.integer "beehive_amount"
    t.float "honey_amount"
    t.decimal "honey_retrievement", precision: 12, scale: 4
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "required"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "client_id"
    t.integer "stock_id"
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "user_id"
    t.integer "sale_id", null: false
    t.index ["sale_id"], name: "index_recipes_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "client_id"
    t.integer "stock_id"
    t.integer "quantity"
    t.decimal "total_price"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_method"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "amount"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "barcode"
    t.boolean "is_salgado"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "recipes", "sales"
end
