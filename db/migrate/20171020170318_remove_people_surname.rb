class RemovePeopleSurname < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :surname
  end
end
