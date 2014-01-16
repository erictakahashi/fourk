class CreateCategoriesEstablishmentsJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_establishments, id: false do |t|
      t.integer :category_id
      t.integer :establishment_id
    end
  end
end
