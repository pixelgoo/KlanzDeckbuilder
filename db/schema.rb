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

ActiveRecord::Schema.define(version: 20170209180202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "clan"
    t.string   "rarity"
    t.boolean  "star"
    t.boolean  "marketable", default: true
    t.integer  "power"
    t.integer  "damage"
    t.string   "ability"
    t.string   "bonus"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "cards_decks", id: false, force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "deck_id", null: false
    t.index ["deck_id", "card_id"], name: "index_cards_decks_on_deck_id_and_card_id", using: :btree
  end

  create_table "decks", force: :cascade do |t|
    t.string  "deck"
    t.string  "name"
    t.text    "info"
    t.integer "module_price", default: 0
    t.integer "star_price",   default: 0
    t.string  "room"
    t.integer "user_id"
    t.index ["user_id"], name: "index_decks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
