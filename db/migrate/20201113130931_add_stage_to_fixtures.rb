class AddStageToFixtures < ActiveRecord::Migration[6.0]
  def change
    add_column :fixtures, :stage, :integer
  end
end
