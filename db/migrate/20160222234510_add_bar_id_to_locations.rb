class AddBarIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :bar_id, :integer
  end
end
