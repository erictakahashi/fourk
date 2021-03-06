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

ActiveRecord::Schema.define(version: 20140120173816) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_establishments", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "establishment_id"
  end

  create_table "categories_foods", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "food_id"
  end

  create_table "establishments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.integer  "zipcode"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "establishments_foods", id: false, force: true do |t|
    t.integer "establishment_id"
    t.integer "food_id"
  end

  create_table "foods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.float    "value"
    t.integer  "food_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "establishment_id"
  end

  add_index "prices", ["establishment_id"], name: "index_prices_on_establishment_id"
  add_index "prices", ["food_id"], name: "index_prices_on_food_id"

  create_table "rates", force: true do |t|
    t.integer  "value"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["establishment_id"], name: "index_rates_on_establishment_id"
  add_index "rates", ["rateable_id"], name: "index_rates_on_rateable_id"
  add_index "rates", ["rateable_type"], name: "index_rates_on_rateable_type"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
