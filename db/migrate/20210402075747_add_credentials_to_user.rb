class AddCredentialsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :picture, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :focus_assist, :boolean, default: true
  end
end
