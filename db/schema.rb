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

ActiveRecord::Schema.define(version: 20150227172329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "mobile"
    t.text     "address"
    t.text     "post_code"
    t.text     "first_name"
    t.text     "last_name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.text     "address"
    t.string   "postcode"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.boolean  "volunteer_text_confirmed"
    t.boolean  "called_client"
    t.boolean  "task_done"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "volunteer_id"
    t.integer  "client_id"
    t.string   "task_type"
    t.text     "description"
    t.integer  "volunteer_two_id"
    t.integer  "volunteer_three_id"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id", using: :btree
  add_index "tasks", ["volunteer_id"], name: "index_tasks_on_volunteer_id", using: :btree
  add_index "tasks", ["volunteer_three_id"], name: "index_tasks_on_volunteer_three_id", using: :btree
  add_index "tasks", ["volunteer_two_id"], name: "index_tasks_on_volunteer_two_id", using: :btree

  create_table "texts", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "number"
    t.text     "body"
    t.integer  "volunteer_id"
  end

  add_index "texts", ["volunteer_id"], name: "index_texts_on_volunteer_id", using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "mobile_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "post_code"
    t.text     "last_name"
    t.boolean  "availability"
    t.boolean  "shopping"
    t.boolean  "prescription_collection"
    t.boolean  "snow_clearance"
    t.boolean  "grit_spreading"
    t.boolean  "dog_walking"
    t.string   "email"
    t.boolean  "dbs"
  end

  add_foreign_key "tasks", "clients"
  add_foreign_key "tasks", "volunteers"
  add_foreign_key "texts", "volunteers"
end
