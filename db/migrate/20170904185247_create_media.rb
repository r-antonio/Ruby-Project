class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :imdb
      t.string :title
      t.string :rated
      t.date :released
      t.integer :runtime
      t.text :synopsis
      t.boolean :airing
      t.datetime :airing_time
      t.boolean :serie
      t.string :poster

      t.timestamps
    end
  end
end
