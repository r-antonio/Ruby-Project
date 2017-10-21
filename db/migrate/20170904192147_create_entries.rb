class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.references :medium, foreign_key: true
      t.integer :caps
      t.integer :rating
      t.string :state
      t.datetime :date_start
      t.datetime :date_finish

      t.timestamps
    end
  end
end
