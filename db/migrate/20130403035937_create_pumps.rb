class CreatePumps < ActiveRecord::Migration
  def change
    create_table :pumps do |t|
      t.string :name
      t.string :code
      t.string :manufacturer
      t.string :model
      t.string :serial_no
      t.references :tank

      t.timestamps
    end
    add_index :pumps, :tank_id
  end
end
