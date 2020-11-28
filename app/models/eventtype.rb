class Eventtype < ApplicationRecord
	has_many :goalevents, dependent: :destroy
end
