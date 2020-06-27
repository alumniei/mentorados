class AddInvitationsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.uuid :invitation_id
      t.references :invited_by, type: :uuid
      t.timestamp :invited_at

      t.foreign_key :users, column: :invited_by_id
    end
  end
end
