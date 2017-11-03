class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  validates :user, presence: true
  validates :medium, presence: true
  validates :caps, numericality: { only_integer: true }
  validates :rating, numericality: { only_integer: true }
  validates :state, presence: true, numericality: { only_integer: true }
  validates :date_start, presence: true
end
