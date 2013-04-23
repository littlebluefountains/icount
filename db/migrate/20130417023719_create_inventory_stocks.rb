class CreateInventoryStocks < ActiveRecord::Migration
  def change
    create_table :inventory_stocks do |t|
      t.float :current_stock

      t.references :tank

      t.timestamps
    end

    add_index :inventory_stocks, :tank_id
  end
end
