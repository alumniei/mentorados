class RemoveLinksAndAddUrlTextToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :url_text, :text
    remove_column :users, :links, :text, default: [], array: true
  end
end
