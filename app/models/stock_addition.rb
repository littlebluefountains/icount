class StockAddition < ActiveRecord::Base
  belongs_to :waybill
  belongs_to :stock
  belongs_to :tank

  attr_accessible :current_quantity, :previous_quantity, :quantity_added
  attr_accessible :waybill_id, :stock_id, :tank_id

  #scope to retun allstocks sorted by tank
  scope :all_stock_addition, order("waybill_id desc, tank_id asc")

  #scope to return the top 10 stock reports for named tank
  scope :top_ten, lambda { |id| where(tank_id: id).order("waybill_id desc, created_at asc").limit(10) }

  #get most recent stock for each tank
  scope :recent_stock, order("tank_id asc, created_at desc").uniq
end
