# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_01_205007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "session_token", null: false
    t.index ["email"], name: "index_friends_on_email", unique: true
    t.index ["session_token"], name: "index_friends_on_session_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "kind"
    t.date "datePublished"
    t.date "coverImagePath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "friend_id", null: false
    t.index ["friend_id"], name: "index_posts_on_friend_id"
  end

  add_foreign_key "posts", "friends"
end
