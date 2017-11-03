class Person < ApplicationRecord
  has_many :actings
  has_many :roles
  validates :name, presence: true, length: { maximum: 60, too_long: "%{count} characters is the maximum allowed"}
  validates :bio, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
end
