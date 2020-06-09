class AddRegistrationIdAndConfirmedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.datetime :confirmed_at
      t.uuid :registration_id, null: false, unique: true, default: -> { "gen_random_uuid()" }
    end
  end
end
