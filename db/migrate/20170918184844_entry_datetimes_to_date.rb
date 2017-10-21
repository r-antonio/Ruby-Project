class EntryDatetimesToDate < ActiveRecord::Migration[5.1]
  def change
    remove_column :entries, :date_start
    remove_column :entries, :date_finish
    add_column :entries, :date_start, :date
    add_column :entries, :date_finish, :date
  end
end
