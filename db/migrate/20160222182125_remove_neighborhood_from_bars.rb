class RemoveNeighborhoodFromBars < ActiveRecord::Migration
  def change
  	remove_column :bars, :neighborhood
  end
end
