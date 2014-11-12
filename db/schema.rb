# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141111164329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menu_item_options", force: true do |t|
    t.string  "name"
    t.decimal "price",        precision: 5, scale: 2
    t.boolean "included"
    t.integer "menu_item_id"
  end

  add_index "menu_item_options", ["menu_item_id"], name: "index_menu_item_options_on_menu_item_id", using: :btree

  create_table "menu_items", force: true do |t|
    t.string  "name"
    t.decimal "price",   precision: 5, scale: 2
    t.integer "menu_id"
  end

  add_index "menu_items", ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree

  create_table "menu_options", force: true do |t|
    t.integer "menu_options_category_id"
    t.string  "name"
    t.decimal "price",                    precision: 5, scale: 2
  end

  add_index "menu_options", ["menu_options_category_id"], name: "index_menu_options_on_menu_options_category_id", using: :btree

  create_table "menu_options_categories", force: true do |t|
    t.string "name"
  end

  create_table "menus", force: true do |t|
    t.string "name"
  end

  create_table "order_item_options", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "order_item_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_item_options", ["order_item_id"], name: "index_order_item_options_on_order_item_id", using: :btree

  create_table "order_items", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "special_requests"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.decimal  "price",        precision: 8, scale: 2
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "access_token"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "access_token"
    t.string   "token_scope"
    t.datetime "token_expired_at"
    t.datetime "token_created_at"
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "customer_id"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
