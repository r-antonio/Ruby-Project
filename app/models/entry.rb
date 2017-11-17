class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  validates :user, presence: true
  validates :medium, presence: true
  validates_inclusion_of :caps, :in => lambda{|entry| 0..entry.medium.episodes}, if: lambda{|e| not e.medium.nil?}
  validates :caps, numericality: { only_integer: true }
  validates_inclusion_of :rating, :in => 1..10, if: lambda{|e| not e.rating.nil?}
  validates :rating, numericality: { only_integer: true }, if: lambda{|e| not e.rating.nil?}
  validates_inclusion_of :state, :in => 1..3
  validates :state, presence: true, numericality: { only_integer: true }
  validates :date_start, presence: true
end
