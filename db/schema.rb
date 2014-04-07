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

ActiveRecord::Schema.define(version: 20140404161257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "featured_lists", force: true do |t|
    t.string  "name"
    t.string  "month"
    t.integer "year"
  end

  create_table "featured_lists_songs", id: false, force: true do |t|
    t.integer "featured_list_id"
    t.integer "song_id"
  end

  create_table "playlists", force: true do |t|
    t.string  "name"
    t.string  "month"
    t.integer "year"
    t.integer "song_id"
    t.integer "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "playlists_songs", id: false, force: true do |t|
    t.integer "playlist_id"
    t.integer "song_id"
  end

  create_table "songs", force: true do |t|
    t.string  "artist"
    t.string  "title"
    t.string  "remix"
    t.integer "rank"
    t.string  "soundcloud_url"
    t.integer "playlist_id"
  end

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin"
    t.string  "soundcloud_username"
  end

end
