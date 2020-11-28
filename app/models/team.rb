class Team < ApplicationRecord
  belongs_to :club
  has_many :players, dependent: :destroy
  has_many :fixtures
end
