class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :zipcode
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
