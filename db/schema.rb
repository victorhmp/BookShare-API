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

ActiveRecord::Schema.define(version: 2018_05_04_040902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisements", force: :cascade do |t|
    t.string "book_title"
    t.string "book_author"
    t.string "book_publication"
    t.text "comment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.bigint "trade_id"
    t.index ["trade_id"], name: "index_advertisements_on_trade_id"
    t.index ["user_id"], name: "index_advertisements_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "type"
    t.string "name"
    t.text "excerpt"
    t.text "description"
    t.string "url"
    t.integer "upvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "list_items", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "item_id"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_list_items_on_item_id"
    t.index ["list_id"], name: "index_list_items_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.text "excerpt"
    t.text "description"
    t.integer "upvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "book_title"
    t.string "book_author"
    t.string "book_publication"
    t.text "comment"
    t.bigint "user_id"
    t.bigint "advertisement_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trade_id"
    t.index ["advertisement_id"], name: "index_offers_on_advertisement_id"
    t.index ["trade_id"], name: "index_offers_on_trade_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "status"
    t.bigint "advertisement_id"
    t.bigint "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_trades_on_advertisement_id"
    t.index ["offer_id"], name: "index_trades_on_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "name"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlist_items", force: :cascade do |t|
    t.string "book_title"
    t.string "book_author"
    t.string "book_publication"
    t.bigint "wishlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wishlist_id"], name: "index_wishlist_items_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "advertisements", "trades"
  add_foreign_key "advertisements", "users"
  add_foreign_key "list_items", "items"
  add_foreign_key "list_items", "lists"
  add_foreign_key "offers", "advertisements"
  add_foreign_key "offers", "trades"
  add_foreign_key "offers", "users"
  add_foreign_key "trades", "advertisements"
  add_foreign_key "trades", "offers"
  add_foreign_key "wishlist_items", "wishlists"
end
