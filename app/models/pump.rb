class Pump < ActiveRecord::Base
	validates :tank_id, :name, presence: true
	
  belongs_to :tank
  attr_accessible :code, :manufacturer, :model, :name, :serial_no, :tank_id
end
