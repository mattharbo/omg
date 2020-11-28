class CreateEventtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :eventtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
