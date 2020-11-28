class Goal < ApplicationRecord
  belongs_to :fixture
  belongs_to :team
  has_many :goalevents, dependent: :destroy
end
