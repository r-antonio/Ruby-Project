class ChangeImageToAttachments < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :file_id
    add_attachment :images, :image
  end
end
