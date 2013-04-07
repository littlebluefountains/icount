class Product < ActiveRecord::Base
	validates :name, :unitprice, presence: true
	
  attr_accessible :code, :description, :name, :unitprice

  has_many :product_prices
end
