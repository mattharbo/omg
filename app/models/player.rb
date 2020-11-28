class Player < ApplicationRecord
  belongs_to :team
  has_many :goalevents, dependent: :destroy
end
