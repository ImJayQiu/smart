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

ActiveRecord::Schema.define(version: 20160812083221) do

  create_table "coutlines", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "ename",      limit: 255
    t.string   "name",       limit: 255
    t.string   "des",        limit: 255
    t.string   "major",      limit: 255
    t.string   "ctype",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cschedules", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "term_code",  limit: 255
    t.string   "c_code",     limit: 255
    t.string   "credit",     limit: 255
    t.integer  "weekday",    limit: 4
    t.time     "stime"
    t.time     "etime"
    t.string   "lecturer",   limit: 255
    t.string   "room",       limit: 255
    t.integer  "att",        limit: 4
    t.integer  "homework",   limit: 4
    t.integer  "project",    limit: 4
    t.integer  "report",     limit: 4
    t.integer  "mid",        limit: 4
    t.integer  "fin",        limit: 4
    t.integer  "quiz",       limit: 4
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "other",      limit: 4
  end

  create_table "majors", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.string   "ename",      limit: 255
    t.text     "remark",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "ayear",      limit: 255
    t.string   "term",       limit: 255
    t.date     "s_date"
    t.date     "e_date"
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "code",                   limit: 255,              null: false
    t.string   "name",                   limit: 255
    t.string   "ename",                  limit: 255
    t.string   "gender",                 limit: 255
    t.string   "passport",               limit: 255
    t.date     "birthday"
    t.string   "city",                   limit: 255
    t.string   "province",               limit: 255
    t.string   "country",                limit: 255
    t.string   "role",                   limit: 255,              null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "address",                limit: 255
    t.string   "phone",                  limit: 45
    t.string   "major",                  limit: 45,               null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.date     "enroll",                                          null: false
    t.string   "des",                    limit: 255
  end

  add_index "users", ["code"], name: "code_UNIQUE", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "ustatuses", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.date     "date"
    t.string   "status",     limit: 255
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "visas", force: :cascade do |t|
    t.string   "passport",   limit: 255
    t.date     "due"
    t.string   "remark",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
