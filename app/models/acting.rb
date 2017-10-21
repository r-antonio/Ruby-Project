class Acting < ApplicationRecord
  belongs_to :person
  belongs_to :character
  belongs_to :medium
end
