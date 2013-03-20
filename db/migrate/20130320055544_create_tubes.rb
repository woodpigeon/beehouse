class CreateTubes < ActiveRecord::Migration
  def change
    create_table :tubes do |t|
      t.integer :house_id
      t.string :bee_code
      t.string :colour_code
      t.integer :position

      t.timestamps
    end
  end
end
