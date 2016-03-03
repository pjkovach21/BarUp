class AddAvatarToBar < ActiveRecord::Migration
  def change
    add_column :bars, :avatar, :string
  end
end
