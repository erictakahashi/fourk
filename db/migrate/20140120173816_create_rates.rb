class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :value
      t.integer :rateable_id
      t.string :rateable_type

      t.timestamps
    end

    add_index :rates, :rateable_id
    add_index :rates, :rateable_type
  end
end
