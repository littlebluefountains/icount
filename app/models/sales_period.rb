class SalesPeriod < ActiveRecord::Base
	validates :name, :start_time, :end_time, presence: true
	
  attr_accessible :description, :end_time, :name, :start_time
end
