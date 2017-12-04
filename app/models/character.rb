class Character < ApplicationRecord
  before_save :default_values
  has_many :actings
  has_one :image, as: :imageable, dependent: :destroy
  validates :name, presence: true, length: { maximum: 60, too_long: "%{count} characters is the maximumallowed" }
  validates :bio, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }

  def default_values
    self.image = Image.new if self.image.nil?
  end
end
