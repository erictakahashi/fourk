class AddEstablishmentIdToPrices < ActiveRecord::Migration
  def change
    add_column :prices, :establishment_id, :integer

    add_index :prices, :establishment_id
  end
end
