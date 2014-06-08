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

ActiveRecord::Schema.define(version: 20140608205660) do

  create_table "amk_authentication_credentials", force: true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amk_authentication_credentials", ["email"], name: "index_amk_authentication_credentials_on_email"

  create_table "amk_authentication_sessions", force: true do |t|
    t.string   "uuid"
    t.integer  "credentials_id"
    t.string   "ip_address"
    t.text     "user_agent"
    t.datetime "last_accessed_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "amk_authentication_sessions", ["uuid"], name: "index_amk_authentication_sessions_on_uuid"

end
