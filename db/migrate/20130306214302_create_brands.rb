class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name#, :null => false
      t.string :logo#, :null => false
      t.string :tag#, :null => false

      t.timestamps
    end
  end
end
