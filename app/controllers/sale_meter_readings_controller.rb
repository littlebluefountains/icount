class SaleMeterReadingsController < ApplicationController
	before_filter :startup, except: [:index, :new, :create]
  def index
  	@sales = SaleMeterReading.all
  end

  def new
  	@sale = SaleMeterReading.new
  end

  def show
  end

  def edit
  end

  def create
  	@sale = SaleMeterReading.new(params[:sale])

  	if @sale.save
  		redirect_to sale_meter_readings_path, gflash: {succes: 'Meter Reading saved successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def update
  	if @sale.update_attributes(params[:sale])
  		redirect_to sale_meter_readings_path, gflash: {success: 'Meter Reading updated successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@sales.destroy
  	redirect_to sale_meter_readings_path, gflash: { success: 'Meter Reading deleted successfully'}
  end

  private
  def startup
  	@sale = SaleMeterReading.find(params[:id])
  end
end
