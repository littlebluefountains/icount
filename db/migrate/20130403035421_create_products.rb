class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.text :description
      t.decimal :unitprice

      t.timestamps
    end
  end
end
