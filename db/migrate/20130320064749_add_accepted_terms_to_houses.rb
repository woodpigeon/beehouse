class AddAcceptedTermsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :accepted_terms, :boolean, :default => false, :null => false
    add_index :houses, :product_id
    add_index :tubes, :house_id
    add_index :products, :design_id
    add_index :products, :brand_id
  end
end
