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

ActiveRecord::Schema.define(version: 20170221063644) do

  create_table "forums", force: :cascade do |t|
    t.string   "username"
    t.string   "language"
    t.string   "comments"
    t.datetime "created_at"
  end

  create_table "movies", force: :cascade do |t|
    t.string  "moviename"
    t.string  "language"
    t.integer "rating"
    t.string  "description"
    t.string  "image"
    t.string  "director"
    t.string  "producer"
    t.string  "maincast"
  end

  create_table "registers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "moviename"
    t.string "username"
    t.string "comments"
    t.float  "rating"
  end

end
