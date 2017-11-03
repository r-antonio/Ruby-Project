class Medium < ApplicationRecord
  has_many :roles
  has_many :actings
  validates :imdb, presence: true, length: { minimum: 5, maximum: 10 }
  validates :title, presence: true, length: { maximum: 140 }
  validates :rated, presence: true, length: { minimum: 1, maximum: 3 }
  validates :released, presence: true
  validates :runtime, numericality: { only_integer: true }
  validates :synopsis, presence: true, length: { maximum: 1000 }
  validates :airing, presence: true
  validates :aiting_time, presence: true, if: :airing?
  validates :serie, presence: true
  validates :poster, presence: true
  validates :episodes, presence: true, numericality: { only_integer: true }
end
