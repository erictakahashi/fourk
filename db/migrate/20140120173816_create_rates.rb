class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :value
      t.integer :rateable_id
      t.string :rateable_type
      t.integer :establishment_id

      t.timestamps
    end

    add_index :rates, :rateable_id
    add_index :rates, :rateable_type
    add_index :rates, :establishment_id
  end
end
