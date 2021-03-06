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

  create_table "billings", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",                         null: false
    t.integer  "amount_with_tax",                 null: false
    t.boolean  "is_paid",         default: false, null: false
    t.string   "charge_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "black_lists", force: :cascade do |t|
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_room_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "user_id",      null: false
    t.uuid "chat_room_id", null: false
    t.index ["chat_room_id"], name: "index_chat_room_users_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_chat_room_users_on_user_id", using: :btree
  end

  create_table "chat_rooms", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.index ["item_id"], name: "index_chat_rooms_on_item_id", using: :btree
  end

  create_table "colleges", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "comments", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",    null: false
    t.uuid     "item_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "depertments", force: :cascade do |t|
    t.uuid   "college_id", null: false
    t.string "name",       null: false
    t.index ["college_id"], name: "index_depertments_on_college_id", using: :btree
  end

  create_table "inquiries", force: :cascade do |t|
    t.boolean  "is_acknowledged", default: false, null: false
    t.uuid     "user_id",                         null: false
    t.string   "title"
    t.text     "content",                         null: false
    t.string   "nickname"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["user_id"], name: "index_inquiries_on_user_id", using: :btree
  end

  create_table "item_images", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid   "item_id", null: false
    t.string "image",   null: false
    t.index ["item_id"], name: "index_item_images_on_item_id", using: :btree
  end

  create_table "items", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "user_id",                             null: false
    t.uuid     "buyer_id"
    t.uuid     "college_id",                          null: false
    t.string   "depertment_id",                       null: false
    t.string   "undergraduate_id",                    null: false
    t.string   "name",                                null: false
    t.boolean  "is_pickup",           default: false, null: false
    t.boolean  "reported",            default: false, null: false
    t.integer  "row_price",                           null: false
    t.string   "image",                               null: false
    t.integer  "price_with_margin"
    t.text     "description",                         null: false
    t.integer  "transaction_status",  default: 0,     null: false
    t.integer  "preservation_status",                 null: false
    t.boolean  "is_sold",             default: false, null: false
    t.string   "auther"
    t.date     "sold_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["college_id"], name: "index_items_on_college_id", using: :btree
    t.index ["depertment_id"], name: "index_items_on_depertment_id", using: :btree
    t.index ["undergraduate_id"], name: "index_items_on_undergraduate_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "lectures", force: :cascade do |t|
    t.string "name",                        null: false
    t.string "professor_name",              null: false
    t.string "department",                  null: false
    t.string "periods",        default: [], null: false, array: true
    t.string "weekday",                     null: false
    t.string "semester",                    null: false
  end

  create_table "like_users", force: :cascade do |t|
    t.uuid "liker_id", null: false
    t.uuid "like_id",  null: false
    t.index ["like_id"], name: "index_like_users_on_like_id", using: :btree
    t.index ["liker_id"], name: "index_like_users_on_liker_id", using: :btree
  end

  create_table "messages", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "chat_room_id",                 null: false
    t.uuid     "user_id",                      null: false
    t.text     "content",                      null: false
    t.boolean  "is_read",      default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.uuid     "user_id",                    null: false
    t.integer  "status",                     null: false
    t.boolean  "is_read",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "trades", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "item_id",     null: false
    t.uuid     "buyer_id",    null: false
    t.uuid     "user_id",     null: false
    t.string   "trade_token", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["buyer_id"], name: "index_trades_on_buyer_id", using: :btree
    t.index ["item_id"], name: "index_trades_on_item_id", using: :btree
    t.index ["trade_token"], name: "index_trades_on_trade_token", using: :btree
    t.index ["user_id"], name: "index_trades_on_user_id", using: :btree
  end

  create_table "undergraduates", force: :cascade do |t|
    t.uuid   "college_id",    null: false
    t.string "depertment_id", null: false
    t.string "name",          null: false
    t.index ["college_id"], name: "index_undergraduates_on_college_id", using: :btree
    t.index ["depertment_id"], name: "index_undergraduates_on_depertment_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.boolean  "admin",                    default: false, null: false
    t.boolean  "is_disabled",              default: false, null: false
    t.string   "email",                                    null: false
    t.string   "password_digest",                          null: false
    t.string   "name"
    t.text     "introduce"
    t.string   "image"
    t.string   "cover_image"
    t.integer  "gender"
    t.integer  "undergraduate"
    t.integer  "department"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.string   "stripe_cus_id"
    t.string   "card_owner"
    t.string   "country"
    t.string   "brand_name"
    t.integer  "last_4_number"
    t.integer  "good_evaluation_count",    default: 0,     null: false
    t.integer  "neutral_evaluation_count", default: 0,     null: false
    t.integer  "bad_evaluation_count",     default: 0,     null: false
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["stripe_cus_id"], name: "index_users_on_stripe_cus_id", using: :btree
  end

end
