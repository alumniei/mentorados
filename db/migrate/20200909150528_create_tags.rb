class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.json :name
    end

    create_table :user_tags, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :tag, type: :uuid, foreign_key: true
    end
  end
end
