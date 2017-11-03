class Character < ApplicationRecord
  has_many :actings
  validates :name, presence: true, length: { maximum: 60, too_long: "%{count} characters is the maximumallowed" }
  validates :bio, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
