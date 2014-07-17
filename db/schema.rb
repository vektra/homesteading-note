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

ActiveRecord::Schema.define(version: 20140717041711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.string   "short_code"
    t.text     "description"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "content"
    t.text     "in_reply_to"
    t.text     "tags"
    t.text     "syndication"
    t.text     "location_name"
    t.text     "location_latitude"
    t.text     "location_longitude"
    t.text     "location_altitude"
    t.text     "slug"
    t.text     "source"
    t.text     "twitter_url"
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "hour"
    t.string   "minute"
    t.string   "second"
    t.boolean  "private"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.text     "content"
    t.boolean  "editable",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
