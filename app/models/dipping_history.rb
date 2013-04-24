class DippingHistory < ActiveRecord::Base
  belongs_to :tank
  attr_accessible :measured_volume, :measurement_date, :tank_id
end
