class Goalevent < ApplicationRecord
  belongs_to :goal
  belongs_to :player
  belongs_to :eventtype
end
