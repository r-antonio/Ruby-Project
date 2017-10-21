class ChangeEntries < ActiveRecord::Migration[5.1]
  def change
    remove_column :entries, :state
    add_column :entries, :state, :integer
  end
end
