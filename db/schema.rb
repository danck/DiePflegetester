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

ActiveRecord::Schema.define(version: 20130825143754) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "street_number"
    t.integer  "zipcode_id"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "anbieters", force: true do |t|
    t.string   "name"
    t.integer  "contact_data_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_data", force: true do |t|
    t.integer  "address_id"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perimeters", force: true do |t|
    t.integer  "center_id"
    t.string   "neighbor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pflegeberaters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nicname"
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "within_perimeters", force: true do |t|
    t.integer  "zipcode_id"
    t.integer  "neighbor"
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "within_perimeters", ["zipcode_id"], name: "index_within_perimeters_on_zipcode_id", using: :btree

  create_table "zipcodes", force: true do |t|
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zipcodes", ["code"], name: "index_zipcodes_on_code", using: :btree

end
