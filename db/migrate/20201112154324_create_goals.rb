class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :fixture, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :minute

      t.timestamps
    end
  end
end
