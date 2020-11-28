class CreateFixtures < ActiveRecord::Migration[6.0]
  def change
    create_table :fixtures do |t|
      t.references :season, null: false, foreign_key: true
      t.references :hometeam, null: false
      t.references :awayteam, null: false
      t.integer :scorehome
      t.integer :scoreaway
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
