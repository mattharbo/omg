class Competition < ApplicationRecord
	has_many :seasons, dependent: :destroy
end
