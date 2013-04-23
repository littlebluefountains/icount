class SalesPeriodsController < ApplicationController
before_filter :startup, except: [:index, :create, :new]

  def index
  	@sales_periods = SalesPeriod.all
  end

  def show
  end

  def edit
  end

  def new
  	@sales_period = SalesPeriod.new
  end

  def create
  	@sales_period = SalesPeriod.new(params[:sales_period])

  	if @sales_period.save
  		redirect_to sales_periods_path, gflash: {success: 'SalesPeriod saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @sales_period.update_attributes(params[:sales_period])
  		redirect_to sales_periods_path, gflash: {success: 'SalesPeriod updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@sales_period.destroy
  	redirect_to sales_periods_path, gflash: {success: 'SalesPeriod deleted successfully'}
  end


  private
  def startup
  	@sales_period = SalesPeriod.find(params[:id])
  end
end
