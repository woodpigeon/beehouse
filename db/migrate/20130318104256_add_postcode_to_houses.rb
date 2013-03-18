class AddPostcodeToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :postcode, :string
  end
end
