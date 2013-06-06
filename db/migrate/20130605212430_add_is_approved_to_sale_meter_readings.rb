class AddIsApprovedToSaleMeterReadings < ActiveRecord::Migration
  def change
    add_column :sale_meter_readings, :is_approved, :boolean
  end
end
