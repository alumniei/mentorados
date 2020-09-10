class RemoveCareersFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :careers, :text, default: [], array: true, null: false
  end
end
