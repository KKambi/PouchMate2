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

ActiveRecord::Schema.define(version: 2018_11_12_085140) do

  create_table "bests", force: :cascade do |t|
    t.integer "cosmetic_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cosmetic_id"], name: "index_bests_on_cosmetic_id"
    t.index ["user_id"], name: "index_bests_on_user_id"
  end

  create_table "carousel_backgrounds", force: :cascade do |t|
    t.string "name"
    t.string "img_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carousels", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "carousel_background_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carousel_background_id"], name: "index_carousels_on_carousel_background_id"
    t.index ["user_id"], name: "index_carousels_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "writer_id"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cosmetic_infos", force: :cascade do |t|
    t.string "name"
    t.string "info_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cosmetics", force: :cascade do |t|
    t.string "name"
    t.string "memo"
    t.string "category"
    t.date "exp_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "info_id"
    t.integer "carousel_id"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.integer "age"
    t.integer "gender"
    t.boolean "admin", default: false
    t.string "self_intro"
    t.string "profile_img"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
