class AddUuidToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :uuid, :string
  end
end
