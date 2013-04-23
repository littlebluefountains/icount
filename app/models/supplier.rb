class Supplier < ActiveRecord::Base
  validates :name, :contact, :address, presence: true
	
  attr_accessible :address, :contact, :email, :mobile, :name, :phone

  has_many :waybills
end
