class Medium < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :actings, dependent: :destroy
  has_many :entries, dependent: :destroy
  validates :imdb, presence: true, length: { minimum: 5, maximum: 10 }
  validates :title, presence: true, length: { maximum: 140 }
  validates :rated, presence: true, length: { minimum: 1, maximum: 3 }
  validates :released, presence: true
  validates :runtime, presence:true, numericality: { only_integer: true }
  validates :synopsis, presence: true, length: { maximum: 1000 }
  validates_inclusion_of :airing, in: [false,true]
  validates :airing_time, presence: true, if: :airing?
  validates_inclusion_of :serie, in: [false,true]
  validates :poster, presence: true
  validates :episodes, presence: true, numericality: { only_integer: true }
end
