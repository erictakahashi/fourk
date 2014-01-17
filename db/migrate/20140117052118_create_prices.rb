class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :value
      t.integer :food_id

      t.timestamps
    end

    add_index :prices, :food_id
  end
end
