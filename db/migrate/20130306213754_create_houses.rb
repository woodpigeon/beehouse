class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      
      t.integer :product_id, :null => true
      t.integer :code
      t.string :email
      
      t.timestamps
    end
  end
end
