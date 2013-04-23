class SaleMeterReading < ActiveRecord::Base
	belongs_to :pump
  	belongs_to :employee
  	belongs_to :sales_period

	validates :pump_id, :employee_id, :sales_period_id, :opening_reading, :closing_reading, :sales_date, presence: true

	attr_accessible :closing_reading, :comments, :liters_sold, :opening_reading, :sales_date
  	attr_accessible :pump_id, :employee_id, :sales_period_id

  	
  
end
