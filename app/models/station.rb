class Station < ActiveRecord::Base
  before_save :humanize_attributes

  validates :zone_id, :code, :name, presence: true
  
  belongs_to :zone
  has_many :waybills
  has_many :tanks

  attr_accessible :address, :city, :code, :name, :state, :zone_id

  def full_address
    full_address = ""
    
    full_address += self.address unless self.address.blank?
    full_address += ", " + self.city unless self.city.blank?
    #full_address += ", " + self.state unless self.state.blank?
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

  private
  def humanize_attributes
    write_attribute(:code, read_attribute(:code).upcase!)
    write_attribute(:name, read_attribute(:name).humanize)
    write_attribute(:state, read_attribute(:state).humanize) unless :state.blank?
    write_attribute(:city, read_attribute(:city).humanize) unless :city.blank?
    write_attribute(:address, read_attribute(:address).humanize) unless :address.blank?
  end
end
