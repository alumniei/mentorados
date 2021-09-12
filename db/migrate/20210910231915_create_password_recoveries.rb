class CreatePasswordRecoveries < ActiveRecord::Migration[6.1]
  def change
    create_table :password_recoveries, id: :uuid do |t|
      t.string :email, null: false
      t.string :selector, null: false, index: true
      t.string :verifier_digest, null: false

      t.datetime :expires_at, null: false
      t.boolean :used, null: false

      t.timestamps
    end
  end
end
