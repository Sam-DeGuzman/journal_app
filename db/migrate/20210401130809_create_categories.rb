class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
    add_index :categories, :user_id
  end
end
