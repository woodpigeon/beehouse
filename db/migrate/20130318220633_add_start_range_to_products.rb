class AddStartRangeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :range_start, :integer
    add_column :products, :range_end, :integer
  end
end
