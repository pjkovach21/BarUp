class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :neighborhood
      t.string :location

      t.timestamps null: false
    end
  end
end
