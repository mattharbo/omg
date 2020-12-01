class AddAutogoalToGoalevents < ActiveRecord::Migration[6.0]
  def change
    add_column :goalevents, :autogoal, :boolean
  end
end
