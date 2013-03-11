class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand_id#, :null => false
      t.string :design_id#, :null => false
      t.string :name#, :null => false
      t.string :code#, :null => false
      
      t.timestamps
    end
  end
end
