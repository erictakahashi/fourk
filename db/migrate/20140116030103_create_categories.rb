class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :categorizable_id
      t.string :categorizable_type

      t.timestamps
    end

    add_index :categories, :categorizable_type
    add_index :categories, :categorizable_id
  end
end
