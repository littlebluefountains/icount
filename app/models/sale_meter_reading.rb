class SaleMeterReading < ActiveRecord::Base
	before_save :calculate_liters_sold
	before_update :calculate_liters_sold

	belongs_to :pump
  	belongs_to :employee
  	belongs_to :sales_period

	validates :pump_id, :employee_id, :sales_period_id, :opening_reading, :closing_reading, :sales_date, presence: true
	#validates :closing_reading, :opening_reading, :numericality
	#validates :closing_reading_greater_than_opening_reading

	attr_accessible :closing_reading, :comments, :liters_sold, :opening_reading, :sales_date
  	attr_accessible :pump_id, :employee_id, :sales_period_id


  	scope :with_tanks_and_station, includes(:pump)

  	def calculate_liters_sold
    	#calculate liters sold
    	self.liters_sold = self.closing_reading - self.opening_reading
    end

    def closing_reading_greater_than_opening_reading
    	closing_reading < opening_reading
    end
  
end
