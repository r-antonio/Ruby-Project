class CreateActings < ActiveRecord::Migration[5.1]
  def change
    create_table :actings do |t|
      t.references :person, foreign_key: true
      t.references :character, foreign_key: true
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
