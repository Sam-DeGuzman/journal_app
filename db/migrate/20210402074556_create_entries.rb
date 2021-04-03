class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.string :content
      t.datetime :deadline

      t.timestamps
    end
  end
end
