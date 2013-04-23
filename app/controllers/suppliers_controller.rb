class SuppliersController < ApplicationController
  before_filter :startup, except: [:index, :create, :new]

  def index
  	@suppliers = Supplier.all
  end

  def show
  end

  def edit
  end

  def new
  	@supplier = Supplier.new
  end

  def create
  	@supplier = Supplier.new(params[:supplier])

  	if @supplier.save
  		redirect_to suppliers_path, gflash: {success: 'Supplier saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @supplier.update_attributes(params[:supplier])
  		redirect_to suppliers_path, gflash: {success: 'Supplier updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@supplier.destroy
  	redirect_to suppliers_path, gflash: {success: 'Supplier deleted successfully'}
  end


  private
  def startup
  	@supplier = Supplier.find(params[:id])
  end
end
