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

ActiveRecord::Schema.define(version: 20151028233044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_legislators", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "legislator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "address_legislators", ["address_id"], name: "index_address_legislators_on_address_id", using: :btree
  add_index "address_legislators", ["legislator_id"], name: "index_address_legislators_on_legislator_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sha"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "legislators", force: :cascade do |t|
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "leg_id"
    t.string   "transparencydata_id"
    t.string   "level"
    t.string   "chamber"
    t.string   "party"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "sha"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_foreign_key "address_legislators", "addresses"
  add_foreign_key "address_legislators", "legislators"
  add_foreign_key "addresses", "users"
end
