class CreateWaybills < ActiveRecord::Migration
  def change
    create_table :waybills do |t|
      t.string :waybill_number
      t.string :description
      t.date :date_supplied
      t.boolean :approved

      t.float :quantity_supplied
      t.float :overrage_quantity
      t.float :shortage_quantity

      t.references :station
      t.references :supplier
      t.references :product

      t.timestamps
    end
    add_index :waybills, :station_id
    add_index :waybills, :supplier_id
    add_index :waybills, :product_id
  end
end
