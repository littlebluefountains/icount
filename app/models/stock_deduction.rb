class StockDeduction < ActiveRecord::Base
  belongs_to :sales_meter_reading
  belongs_to :stock
  attr_accessible :current_quantity, :previous_quantity, :quantity_deducted
end
