class CreateProductPrices < ActiveRecord::Migration
  def change
    create_table :product_prices do |t|
      t.references :product
      t.decimal :old_price
      t.decimal :new_price
      t.references :user

      t.timestamps
    end
    add_index :product_prices, :product_id
    add_index :product_prices, :user_id
  end
end
