class AddStatusToFixtures < ActiveRecord::Migration[6.0]
  def change
  	add_column :fixtures, :status, :string
  end
end
