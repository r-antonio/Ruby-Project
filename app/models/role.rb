class Role < ApplicationRecord
  belongs_to :person
  belongs_to :medium
  validates :role, presence: true, length: { maximum: 30, too_long: "%{count} characters is the maximum allowed" }
  validates :person, presence: true
  validates :medium, presence: true
end
