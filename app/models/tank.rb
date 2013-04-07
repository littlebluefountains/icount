class Tank < ActiveRecord::Base

  validates :product_id, :station_id, :name, :capacity, presence: true

  attr_accessible :capacity, :code, :name, :product_id, :station_id

  belongs_to :product
  belongs_to :station
end
