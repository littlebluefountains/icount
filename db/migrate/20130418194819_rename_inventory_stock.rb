class RenameInventoryStock < ActiveRecord::Migration
  def up
  	rename_table :inventory_stocks, :stocks
  end

  def down
  end
end
