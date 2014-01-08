class CreateEstablishmentsFoodsJoinTable < ActiveRecord::Migration
  def change
    create_table :establishments_foods, id: false do |t|
      t.integer :establishment_id
      t.integer :food_id
    end
  end
end
