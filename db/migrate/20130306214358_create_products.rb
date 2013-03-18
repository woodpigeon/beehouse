class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.integer :design_id
      t.string :name
      t.string :code
      
      t.timestamps
    end
  end
end
