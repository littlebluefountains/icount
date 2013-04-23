class CreateStockDeductions < ActiveRecord::Migration
  def change
    create_table :stock_deductions do |t|
      t.float :quantity_deducted
      t.float :previous_quantity
      t.float :current_quantity
      
      t.references :sales_meter_reading
      t.references :stock

      t.timestamps
    end
    add_index :stock_deductions, :sales_meter_reading_id
    add_index :stock_deductions, :stock_id
  end
end
