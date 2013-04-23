class CreateStockAdditions < ActiveRecord::Migration
  def change
    create_table :stock_additions do |t|
      t.float :quantity_added
      t.float :previous_quantity
      t.float :current_quantity
      t.references :waybill
      t.references :stock

      t.timestamps
    end
    add_index :stock_additions, :waybill_id
    add_index :stock_additions, :stock_id
  end
end
