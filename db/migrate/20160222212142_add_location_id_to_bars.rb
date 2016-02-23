class AddLocationIdToBars < ActiveRecord::Migration
  def change
    add_reference :bars, :location, index: true, foreign_key: true
  end
end
