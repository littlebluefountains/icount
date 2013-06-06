class ProductsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :startup, except: [:index, :create, :new]
  #before_filter :update_product_price, only: [:create, :update]

  def index
  	@products = Product.all
  end

  def show
  end

  def edit
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(params[:product])

  	if @product.save
  		redirect_to products_path, gflash: {success: 'Product saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @product.update_attributes(params[:product])
  		redirect_to products_path, gflash: {success: 'Product updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to products_path, gflash: {success: 'Product deleted successfully'}
  end


  private
  def startup
  	@product = Product.find(params[:id])
  end

  # def update_product_prices
  #   product_price = 
  # end
end
