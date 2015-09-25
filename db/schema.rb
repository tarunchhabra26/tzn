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
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.integer  "isbn"
    t.string   "authors"
    t.string   "description"
    t.string   "status"
    t.datetime "return_date"
    t.integer  "created_by"
    t.integer  "last_updated_by"
    t.integer  "row_state"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "history_status"
    t.integer  "user_id"
    t.string   "comment"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "row_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "emailid"
    t.string   "securityq"
    t.string   "ans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
