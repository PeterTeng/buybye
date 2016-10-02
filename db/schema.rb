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

ActiveRecord::Schema.define(version: 20161002113435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "colleges", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.text "content", null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "exhibit_images", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid   "exhibit_id", null: false
    t.string "image",      null: false
    t.index ["exhibit_id"], name: "index_exhibit_images_on_exhibit_id", using: :btree
  end

  create_table "exhibits", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid    "user_id", null: false
    t.string  "name",    null: false
    t.integer "price",   null: false
    t.integer "status",  null: false
    t.boolean "is_sold", null: false
    t.string  "auther",  null: false
    t.index ["user_id"], name: "index_exhibits_on_user_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "college_id",                      null: false
    t.boolean  "admin",           default: false, null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.text     "introduce"
    t.integer  "gender"
    t.integer  "undergraduate"
    t.integer  "department"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["college_id"], name: "index_users_on_college_id", using: :btree
  end

end
