class SalesController < ApplicationController
  before_filter :startup, except: [:index, :new, :create]
  def index
  	@sales = SalesMeterReading.all
  end

  def new
  	@sale = SalesMeterReading.new
  end

  def show
  end

  def edit
  end

  def create
  	@sale = SalesMeterReading.new(params[:sale])

  	if @sale.save
  		redirect_to sales_path, gflash: {succes: 'Meter Reading saved successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def update
  	if @sale.upadte_attributes(params[:sale])
  		redirect_to sales_path, gflash: {success: 'Meter Reading updwted successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@sales.destroy
  	redirect_to sales_path, gflash: { success: 'Meter Reading deleted successfully'}
  end

  private
  def startup
  	@sale = SalesMeterReading.find(params[:id])
  end
end
