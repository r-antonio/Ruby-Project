class DeleteSurnameInCharacters < ActiveRecord::Migration[5.1]
  def change
    remove_column :characters, :surname
  end
end
