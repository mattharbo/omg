class Fixture < ApplicationRecord
  belongs_to :season
  belongs_to :hometeam, :class_name => "Team"
  belongs_to :awayteam, :class_name => "Team"
  has_many :goals

    accepts_nested_attributes_for :goals

end
