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

ActiveRecord::Schema.define(version: 20160401202750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "contact_email"
    t.string   "name",          null: false
    t.string   "slug",          null: false
    t.text     "description",   null: false
    t.text     "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.integer "agency_id",  null: false
    t.integer "product_id", null: false
  end

  add_index "customers", ["agency_id"], name: "index_customers_on_agency_id", using: :btree
  add_index "customers", ["product_id"], name: "index_customers_on_product_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "products", force: :cascade do |t|
    t.text   "long_description",         null: false
    t.string "fedramp_inprocess_agency"
    t.string "founded_year"
    t.string "icon_url"
    t.string "linkedin_id"
    t.string "location"
    t.string "logo_url"
    t.string "name",                     null: false
    t.string "number_of_employees"
    t.string "slug",                     null: false
    t.string "sales_poc"
    t.string "short_description",        null: false
    t.string "status"
    t.string "url",                      null: false
    t.string "twitter_handle"
  end

end
