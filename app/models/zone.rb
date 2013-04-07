class Zone < ActiveRecord::Base
  validates :name, presence: true
  
  attr_accessible :code, :description, :name
  has_many :stations
end
