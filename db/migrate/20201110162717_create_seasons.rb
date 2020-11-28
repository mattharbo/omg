class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.references :competition, null: false, foreign_key: true
      t.string :startyear

      t.timestamps
    end
  end
end
