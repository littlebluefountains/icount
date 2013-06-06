class AddSalesReferenceNoToSalesMeterReading < ActiveRecord::Migration
  def change
    add_column :sale_meter_readings, :sales_reference_no, :string
  end
end
