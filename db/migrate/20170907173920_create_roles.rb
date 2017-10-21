class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.references :person, foreign_key: true
      t.references :medium, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
