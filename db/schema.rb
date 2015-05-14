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

ActiveRecord::Schema.define(version: 20150514022311) do

  create_table "admins", force: :cascade do |t|
    t.string   "username",           limit: 255, default: "", null: false
    t.string   "email",              limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "answer_sheets", force: :cascade do |t|
    t.integer  "subject_id",     limit: 4
    t.integer  "question_id",    limit: 4
    t.integer  "option_id",      limit: 4
    t.integer  "examination_id", limit: 4
    t.text     "answer_content", limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "correct",        limit: 1,     default: false
  end

  create_table "examinations", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "status",            limit: 255, default: "Start"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "subject_id",        limit: 4
    t.integer  "submited_duration", limit: 4,   default: 0
    t.date     "end_testing_at"
    t.boolean  "correct",           limit: 1,   default: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.string   "description", limit: 255
    t.boolean  "correct",     limit: 1,   default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "subject_id",  limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "duration",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "email",              limit: 255
    t.string   "password_digest",    limit: 255
    t.boolean  "admin",              limit: 1,   default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "encrypted_password", limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
