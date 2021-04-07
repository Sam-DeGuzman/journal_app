class AddEntryStatToEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :entry_stat, :string, default: 'To-do'
  end
end
