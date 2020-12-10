class AddGoalcoordsToGoalevents < ActiveRecord::Migration[6.0]
  def change
  	add_column :goalevents, :goalxcoord, :float
  	add_column :goalevents, :goalycoord, :float
  end
end
