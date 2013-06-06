class SalesPeriod < ActiveRecord::Base
	before_save :humanize_attributes

	validates :name, :start_time, :end_time, presence: true
	
  attr_accessible :description, :end_time, :name, :start_time

  private
  def humanize_attributes
  	write_attribute(:name, read_attribute(:name).upcase!)
  	write_attribute(:description, read_attribute(:description).humanize)
  end
end
