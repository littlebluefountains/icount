class Supplier < ActiveRecord::Base
  before_save :humanize_attributes

  validates :name, :contact, :address, presence: true
	
  attr_accessible :address, :contact, :email, :mobile, :name, :phone

  has_many :waybills

  private
  def humanize_attributes
  	write_attribute(:name, read_attribute(:name).humanize)
  	write_attribute(:contact, read_attribute(:contact).humanize) 
  	write_attribute(:address, read_attribute(:address).humanize) unless :address.blank?
  end
end
