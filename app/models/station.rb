class Station < ActiveRecord::Base
  validates :zone_id, presence: true
  belongs_to :zone
  attr_accessible :address, :city, :code, :name, :state, :zone_id

  def full_address
  	"#{self.address}, #{self.city}"
  end
end
