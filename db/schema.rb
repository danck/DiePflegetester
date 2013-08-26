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

ActiveRecord::Schema.define(version: 20130826091547) do

  create_table "anbieters", force: true do |t|
    t.integer  "zipcode_id"
    t.string   "name"
    t.string   "street"
    t.string   "street_number"
    t.string   "city"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "anbieter_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.boolean  "published"
    t.boolean  "validated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nicname"
    t.string   "name"
    t.string   "email"
    t.string   "role",            default: "benutzer"
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
