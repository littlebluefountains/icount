class CreateDippingHistories < ActiveRecord::Migration
  def change
    create_table :dipping_histories do |t|
      t.references :tank
      t.float :measured_volume
      t.date :measurement_date

      t.timestamps
    end
    add_index :dipping_histories, :tank_id
  end
end
