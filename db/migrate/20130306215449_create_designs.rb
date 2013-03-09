class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :name
      t.integer :vertical_tubes
      t.integer :horizontal_tubes

      t.timestamps
    end
  end
end
