class Product < ActiveRecord::Base
	before_save :update_product_price
	validates :name, :unitprice, presence: true
	
  attr_accessible :code, :description, :name, :unitprice

  has_many :product_prices
  has_many :waybills

  
  private
  #before_save - record the old product price
  #after_save - validate if the old price== the new price; if it is not, create new instance of price_history and save
  def update_product_price

  	if @old_price != unitprice && @old_price != 0
  		#price = ProductPrices.new (product_id: id, old_price: @old_price, new_price: unitprice, user_id: current_user.id)
  		price = ProductPrices.new
  		price.product_id = id
  		price.old_price = @old_price
  		price.new_price = unitprice
  		#price.user_id = current_user.id
  		price.save
  	end
  end

  after_find do |product|
  	@old_price = product.unitprice
  end

  after_initialize do |product|
  	@old_price = product.unitprice
  end


end
