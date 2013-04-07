class ProductsController < ApplicationController
  before_filter :startup, except: [:index, :create, :new]

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
  	@product = Product.create(params[:product])

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
end
