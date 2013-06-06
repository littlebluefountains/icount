class StockDeduction < ActiveRecord::Base
  belongs_to :sale_meter_reading
  belongs_to :stock
  belongs_to :tank

  attr_accessible :current_quantity, :previous_quantity, :quantity_deducted
  attr_accessible :sale_meter_reading_id, :stock_id, :tank_id

  scope :latest_deduction, lambda { |tank_id| where("tank_id = ?", tank_id).order("created_at desc") }
  #scope :recent_stock, order("tank_id asc, created_at desc").uniq


   #scope to retun allstocks sorted by tank
   scope :all_stock_deduction, order("tank_id asc")
  #scope :all_stock_deduction, order("tank_id asc, sale_meter_reading_id desc")

  #scope to return the top 10 stock reports for named tank
  scope :top_ten, lambda { |id| where(tank_id: id).order("sale_meter_reading_id desc, created_at asc").limit(10) }

  #get most recent stock for each tank
  scope :recent_stock, order("tank_id asc, created_at desc").uniq

 
  def calculate_deduction(liters_sold, prev_qty)
  	#qty_deducted = liters_sold
  	#prev_qty = pass in from latest stock
  	#curr_qty = prev_qty - qty_deducted

  	write_attribute(:quantity_deducted, liters_sold)
  	write_attribute(:previous_quantity, prev_qty)
  	write_attribute(:current_quantity, prev_qty - liters_sold)
  end
end
