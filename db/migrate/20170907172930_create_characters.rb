class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :surname
      t.text :bio

      t.timestamps
    end
  end
end
