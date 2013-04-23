class Stock < ActiveRecord::Base
  attr_accessible :current_stock, :tank_id

  belongs_to :tank

  #scope to retun allstocks sorted by tank
  scope :all_stock, order("tank_id asc, created_at desc")

  #scope to return the top 10 stock reports for named tank
  scope :top_ten, lambda { |id| where(tank_id: id).order("created_at asc").limit(10) }

  #get most recent stock for each tank
  scope :recent_stock, order("created_at desc").uniq
  #scope :recent_stock, :all_stock.uniq

end
