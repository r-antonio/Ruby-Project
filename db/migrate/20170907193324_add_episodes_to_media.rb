class AddEpisodesToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :episodes, :integer
  end
end
