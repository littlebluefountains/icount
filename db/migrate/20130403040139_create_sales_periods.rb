class CreateSalesPeriods < ActiveRecord::Migration
  def change
    create_table :sales_periods do |t|
      t.string :name
      t.string :description
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
