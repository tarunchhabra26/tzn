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

ActiveRecord::Schema.define(version: 20151007194420) do

  create_table "books", force: :cascade do |t|
    t.string  "isbn",                   limit: 100, null: false
    t.string  "title",                  limit: 100, null: false
    t.string  "author",                 limit: 100
    t.text    "description"
    t.boolean "status",                             null: false
    t.string  "email"
    t.string  "send_mail_notification"
    t.boolean "is_recommendation"
  end

  create_table "histories", force: :cascade do |t|
    t.string   "isbn",       limit: 100, null: false
    t.string   "email",      limit: 100, null: false
    t.datetime "checkout"
    t.datetime "checkin"
    t.string   "status",     limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rec_books", force: :cascade do |t|
    t.string   "Name"
    t.string   "Author"
    t.string   "Description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 100, null: false
    t.string   "password",   limit: 100, null: false
    t.string   "name",       limit: 100, null: false
    t.boolean  "is_admin",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
