class ProductPricesController < ApplicationController
  def index
  	@product_prices = ProductPrices.all
  end

  def show
  	@product_prices = ProductPrices.find(params[:id])
  end
end
