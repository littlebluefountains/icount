read_attribute(class Zone < ActiveRecord::Base
  before_save :humanize_attributes

  validates :name, :code, presence: true
  
  attr_accessible :code, :description, :name
  has_many :stations

  private
  def humanize_attributes
  	write_attribute(:code, read_attribute(:code).upcase! )
  	write_attribute(:name, read_attribute(:name).humanize)
  	write_attribute(:description, read_attribute(:description).humanize ) unless read_attribute(:description).blank?
  end
end
