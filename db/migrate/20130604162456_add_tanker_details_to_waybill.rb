class AddTankerDetailsToWaybill < ActiveRecord::Migration
  def change
    add_column :waybills, :tanker_driver, :string
    add_column :waybills, :tanker_plate_no, :string
    add_column :waybills, :tanker_registration, :string
  end
end
