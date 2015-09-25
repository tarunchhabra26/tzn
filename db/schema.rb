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

ActiveRecord::Schema.define(version: 20150924113451) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "book_histories", force: :cascade do |t|
    t.integer  "book_id",        limit: 4
    t.integer  "history_status", limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "comment",        limit: 255
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "row_state",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.integer  "isbn",            limit: 4
    t.string   "authors",         limit: 255
    t.string   "description",     limit: 255
    t.string   "status",          limit: 255
    t.datetime "return_date"
    t.integer  "created_by",      limit: 4
    t.integer  "last_updated_by", limit: 4
    t.integer  "row_state",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "book_id",        limit: 4
    t.integer  "history_status", limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "comment",        limit: 255
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "row_state",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "age",        limit: 4
    t.integer  "student_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname",      limit: 255
    t.string   "lname",      limit: 255
    t.string   "emailid",    limit: 255
    t.string   "securityq",  limit: 255
    t.string   "ans",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
