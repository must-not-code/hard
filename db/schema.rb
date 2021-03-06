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

ActiveRecord::Schema.define(version: 20151214193108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "carousels", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at"
    t.text     "content"
    t.integer  "post_id",       null: false
    t.integer  "user_id",       null: false
    t.integer  "tournament_id"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_post", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_user", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "start_at"
    t.integer  "hr_score"
    t.integer  "enemy_score"
    t.string   "country"
    t.string   "enemy"
    t.string   "tourney"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "role"
    t.string   "photo"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vk"
    t.string   "twitch"
    t.date     "birthday"
    t.integer  "position"
    t.string   "status"
    t.string   "country"
    t.string   "city"
    t.string   "mouse"
    t.string   "keyboard"
    t.string   "headset"
    t.string   "pad"
    t.string   "mouse_link"
    t.string   "keyboard_link"
    t.string   "headset_link"
    t.string   "pad_link"
    t.text     "about"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text   "content_ru"
    t.text   "content_en"
  end

  create_table "partners", force: :cascade do |t|
    t.string   "title"
    t.string   "logo"
    t.text     "content_ru"
    t.string   "site"
    t.string   "site_icon"
    t.string   "vk"
    t.string   "fb"
    t.string   "instagram"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content_en"
  end

  create_table "post_attachments", force: :cascade do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "game"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.string   "preview"
    t.integer  "views",        default: 0
  end

  add_index "posts", ["user_id"], name: "index_posts_user", using: :btree

  create_table "streams", force: :cascade do |t|
    t.string   "streamer"
    t.integer  "views"
    t.boolean  "online"
    t.string   "channel"
    t.string   "banner"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "game"
    t.string   "title"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.string   "username"
    t.string   "crypted_password"
    t.string   "email"
    t.string   "skype"
    t.text     "about"
    t.string   "group",                           default: "user"
    t.string   "salt",                            default: ""
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "name"
    t.string   "vk"
    t.string   "facebook"
    t.string   "link"
    t.string   "twitch"
    t.string   "twitter"
    t.string   "country"
    t.string   "city"
    t.datetime "last_activity_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_activity_at"], name: "index_users_on_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "youtube_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
