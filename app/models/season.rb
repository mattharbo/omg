class Season < ApplicationRecord
  belongs_to :competition
  has_many :fixtures, dependent: :destroy
end
