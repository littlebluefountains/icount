class AddSalesDateToSalesMeterReading < ActiveRecord::Migration
  def change
    add_column :sales_meter_readings, :sales_date, :date
  end
end
