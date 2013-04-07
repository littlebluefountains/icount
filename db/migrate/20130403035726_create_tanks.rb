class CreateTanks < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name
      t.string :code
      t.integer :capacity
      t.references :product
      t.references :station

      t.timestamps
    end
    add_index :tanks, :product_id
    add_index :tanks, :station_id
  end
end
