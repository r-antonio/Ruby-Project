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

ActiveRecord::Schema.define(version: 20171204165612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actings", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "character_id"
    t.bigint "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_actings_on_character_id"
    t.index ["medium_id"], name: "index_actings_on_medium_id"
    t.index ["person_id"], name: "index_actings_on_person_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "medium_id"
    t.integer "caps"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state"
    t.date "date_start"
    t.date "date_finish"
    t.index ["medium_id"], name: "index_entries_on_medium_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "imdb"
    t.string "title"
    t.string "rated"
    t.date "released"
    t.integer "runtime"
    t.text "synopsis"
    t.boolean "airing"
    t.datetime "airing_time"
    t.boolean "serie"
    t.string "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "episodes"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "medium_id"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_roles_on_medium_id"
    t.index ["person_id"], name: "index_roles_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "username"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "actings", "characters"
  add_foreign_key "actings", "media"
  add_foreign_key "actings", "people"
  add_foreign_key "entries", "media"
  add_foreign_key "entries", "users"
  add_foreign_key "roles", "media"
  add_foreign_key "roles", "people"
end
