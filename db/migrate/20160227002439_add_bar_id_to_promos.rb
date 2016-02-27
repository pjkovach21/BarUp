class AddBarIdToPromos < ActiveRecord::Migration
  def change
    add_column :promos, :bar_id, :integer
  end
end
