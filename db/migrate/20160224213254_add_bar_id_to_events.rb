class AddBarIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :bar_id, :integer
  end
end
