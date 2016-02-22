class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :title
      t.integer :date
      t.string :description

      t.timestamps null: false
    end
  end
end
