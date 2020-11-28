class CreateGoalevents < ActiveRecord::Migration[6.0]
  def change
    create_table :goalevents do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :assist
      t.float :startdepth
      t.float :startwidth
      t.float :enddepth
      t.float :endwidth
      t.references :eventtype, null: false, foreign_key: true
      t.boolean :penalty

      t.timestamps
    end
  end
end
