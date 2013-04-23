class CreateSalesMeterReadings < ActiveRecord::Migration
  def change
    create_table :sales_meter_readings do |t|
      t.float :opening_reading
      t.float :closing_reading
      t.float :liters_sold
      t.text :comments

      t.references :pump
      t.references :sales_person
      t.references :sales_period

      t.timestamps
    end
    add_index :sales_meter_readings, :pump_id
    add_index :sales_meter_readings, :sales_person_id
    add_index :sales_meter_readings, :sales_period_id
  end
end
