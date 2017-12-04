class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :medium

  before_validation :validate_state

  validates :user, presence: true
  validates :medium, presence: true
  validates_inclusion_of :caps, :in => lambda{|entry| 0..entry.medium.episodes}, if: lambda{|e| not e.medium.nil?}
  validates :caps, numericality: { only_integer: true }
  validates_inclusion_of :rating, :in => 1..10, if: lambda{|e| not e.rating.nil?}
  validates :rating, numericality: { only_integer: true }, if: lambda{|e| not e.rating.nil?}
  validates_inclusion_of :state, :in => 1..3
  validates :state, presence: true, numericality: { only_integer: true }
  validates :date_start, presence: true

  private
    def validate_state
      if not [2,3].include?(self.state_was) and self.state == 2
        self.date_start = Date.today
      elsif self.state_was != 3 and self.state == 3
          if self.date_start_was.nil?
            self.date_start = Date.today
          end
          self.date_finish = Date.today
          self.caps = self.medium.episodes
      end
    end
end
