# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_08_165019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.boolean "blocked", default: false, null: false
    t.boolean "admin", default: false, null: false
    t.boolean "mentor", default: false, null: false
    t.boolean "active", default: false
    t.text "name"
    t.text "bio"
    t.text "picture_url"
    t.text "picture"
    t.integer "year_in"
    t.integer "year_out"
    t.text "links", default: [], array: true
    t.text "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "confirmed_at"
    t.uuid "registration_id", default: -> { "gen_random_uuid()" }, null: false
    t.index "lower((email)::text)", name: "index_users_on_lower_email", unique: true
  end

end
