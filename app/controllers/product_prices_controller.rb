class ProductPricesController < ApplicationController
  load_and_authorize_resource
  
  def index
  	@product_prices = ProductPrices.all
  end

  def show
  	@product_price = ProductPrices.find(params[:id])
  end
end
