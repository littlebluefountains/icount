class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :code
      t.string :state
      t.string :city
      t.string :address
      t.references :zone

      t.timestamps
    end
    add_index :stations, :zone_id
  end
end
