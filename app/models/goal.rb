class Goal < ApplicationRecord
  belongs_to :fixture
  belongs_to :team
  has_many :goalevents, dependent: :destroy
  accepts_nested_attributes_for :goalevents
end
