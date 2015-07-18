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

ActiveRecord::Schema.define(version: 20150710142402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hirings", force: true do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applicants", force: true do |t|
    t.integer  "job_id"
    t.integer  "applicant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "user_id"
    t.string   "job_title"
    t.text     "job_description"
    t.string   "job_state"
    t.string   "job_city"
    t.string   "job_street"
    t.string   "job_zip"
    t.float    "job_latitude"
    t.float    "job_longitude"
    t.string   "current_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "fb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

end
