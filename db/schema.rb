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

ActiveRecord::Schema.define(version: 2019_04_10_062538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bgames_data", force: :cascade do |t|
    t.string "game_name"
    t.integer "bgg_rank"
    t.integer "play_time"
    t.integer "player_count"
    t.integer "suitable_ages"
    t.string "complexity"
    t.string "category"
    t.string "mechanic"
    t.string "designer"
    t.string "publisher"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_archives", force: :cascade do |t|
    t.string "game_name"
    t.integer "game_rank"
    t.integer "playing_time"
    t.string "category"
    t.string "mechanic"
    t.string "designer"
    t.string "image_url"
    t.string "thumb_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_game_archives_on_user_id"
  end

  create_table "game_items", force: :cascade do |t|
    t.text "description"
    t.bigint "game_archive_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_archive_id"], name: "index_game_items_on_game_archive_id"
    t.index ["user_id"], name: "index_game_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_archives", "users"
  add_foreign_key "game_items", "game_archives"
  add_foreign_key "game_items", "users"
end
