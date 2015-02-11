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

ActiveRecord::Schema.define(version: 20150211014446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "legal_profiles", force: true do |t|
    t.integer  "cnpj"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "outdoors", force: true do |t|
    t.string   "code"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "company"
    t.decimal  "price"
    t.boolean  "avaliable",        default: true
    t.string   "image"
    t.integer  "media_company_id"
  end

  add_index "outdoors", ["media_company_id"], name: "index_outdoors_on_media_company_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "telephone"
    t.integer  "profile_id"
    t.string   "profile_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["profile_id", "profile_type"], name: "index_people_on_profile_id_and_profile_type", using: :btree

  create_table "physical_profiles", force: true do |t|
    t.integer  "cpf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
    t.boolean  "super_admin",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
