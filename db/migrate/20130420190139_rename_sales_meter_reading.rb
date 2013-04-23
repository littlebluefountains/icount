class RenameSalesMeterReading < ActiveRecord::Migration
  def up
  	rename_table :sales_meter_readings, :sale_meter_readings
  end

  def down
  end
end
