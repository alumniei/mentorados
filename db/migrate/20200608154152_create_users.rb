class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
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

      t.timestamps

      t.index "lower(email)", name: "index_users_on_lower_email", unique: true
    end
  end
end
