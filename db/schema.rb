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

ActiveRecord::Schema.define(version: 20160208123425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "galleries", force: :cascade do |t|
    t.datetime "posted_at"
    t.string   "language"
    t.string   "file_size"
    t.integer  "length"
    t.float    "rating"
    t.integer  "gid"
    t.string   "token"
    t.string   "title"
    t.string   "cover"
    t.string   "sort"
    t.string   "tags",                    array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uploader"
    t.index ["gid", "token"], name: "index_galleries_on_gid_and_token", using: :btree
    t.index ["language", "rating", "sort"], name: "index_galleries_on_language_and_rating_and_sort", using: :btree
    t.index ["tags"], name: "index_galleries_on_tags", using: :gin
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "page"
    t.integer  "gallery_id"
    t.string   "imgkey"
    t.string   "showkey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "startkey"
    t.index ["gallery_id", "page"], name: "index_pictures_on_gallery_id_and_page", using: :btree
    t.index ["gallery_id"], name: "index_pictures_on_gallery_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "member_id"
    t.string   "pass_hash"
    t.boolean  "exhentai"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
