class RecreateStockDeductions < ActiveRecord::Migration
  def change
  	#drop_index :stock_deductions, :sales_meter_reading_id
  	drop_table :stock_deductions
    drop_table :stock_additions
    drop_table :sale_meter_readings

    create_table :sale_meter_readings do |t|
      t.float :opening_reading
      t.float :closing_reading
      t.float :liters_sold
      t.text :comments
      t.date :sales_date

      t.references :pump
      t.references :employee
      t.references :sales_period

      t.timestamps
    end
    add_index :sale_meter_readings, :pump_id
    add_index :sale_meter_readings, :employee_id
    add_index :sale_meter_readings, :sales_period_id

    create_table :stock_deductions do |t|
      t.float :quantity_deducted
      t.float :previous_quantity
      t.float :current_quantity
      
      t.references :sale_meter_reading
      t.references :stock
      t.references :tank

      t.timestamps
    end
    add_index :stock_deductions, :sale_meter_reading_id
    add_index :stock_deductions, :stock_id
    add_index :stock_deductions, :tank_id

    create_table :stock_additions do |t|
      t.float :quantity_added
      t.float :previous_quantity
      t.float :current_quantity

      t.references :waybill
      t.references :stock
      t.references :tank

      t.timestamps
    end
    add_index :stock_additions, :waybill_id
    add_index :stock_additions, :stock_id
    add_index :stock_additions, :tank_id
  end
end
