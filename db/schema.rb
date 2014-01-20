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

ActiveRecord::Schema.define(version: 20140120155414) do

  create_table "articles", force: true do |t|
    t.string "slug"
    t.string "body"
    t.string "title"
    t.date   "published_at"
  end

  add_index "articles", ["published_at"], name: "index_articles_on_published_at"
  add_index "articles", ["slug"], name: "index_articles_on_published_year_and_published_month_and_slug", unique: true

end
