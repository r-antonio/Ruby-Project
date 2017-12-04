class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  
  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url => "/images/:id/:filename",
    :default_url => '/images/default.png'

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
