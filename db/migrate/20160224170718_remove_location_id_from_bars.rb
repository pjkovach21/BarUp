class RemoveLocationIdFromBars < ActiveRecord::Migration
  def change
  	remove_column :bars, :location_id
  end
end
