class AddCareersToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.text :careers, default: [], array: true, null: false
    end
  end
end
