class AddCoverImageToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :cover_image, :string
  end
end
