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

ActiveRecord::Schema.define(version: 20170329010933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "inventory_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
    t.index ["inventory_id"], name: "index_cart_items_on_inventory_id", using: :btree
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "total"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
    t.string   "cart_token"
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "size"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "style"
    t.integer  "price"
    t.string   "image"
    t.string   "materials"
    t.text     "description"
    t.string   "sock_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "stock_photo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.string   "token"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "inventories"
  add_foreign_key "carts", "users"
  add_foreign_key "inventories", "products"
end
