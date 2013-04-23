class Station < ActiveRecord::Base
  validates :zone_id, presence: true
  
  belongs_to :zone
  has_many :waybills
  has_many :tanks

  attr_accessible :address, :city, :code, :name, :state, :zone_id

  def full_address
  	"#{self.address}, #{self.city}"
  end

  def tank_count
  	tanks.count
  end

  def tank_capacities
  	tanks.sum("capacity")	
  end

  def pump_count
  	tot = 0
  	tanks.each do |t|
  		tot += t.pump_count
  	end
  	return tot
  end
end
