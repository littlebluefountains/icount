class SaleMeterReadingsController < ApplicationController
	load_and_authorize_resource

  before_filter :startup, except: [:index, :new, :create]

  def index
  	#@sale_meter_readings = SaleMeterReading.all
    @sale_meter_readings = SaleMeterReading.with_pump
  end

  def new
  	@sale_meter_reading = SaleMeterReading.new
  end

  def show
  end

  def edit
  end

  def create
  	@sale_meter_reading = SaleMeterReading.new(params[:sale_meter_reading])

    #calculate_liters_sold

  	if @sale_meter_reading.save
  		redirect_to sale_meter_readings_path, gflash: {succes: 'Meter Reading saved successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def update
    

  	if @sale_meter_reading.update_attributes(params[:sale_meter_reading])
  		redirect_to sale_meter_readings_path, gflash: {success: 'Meter Reading updated successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@sale_meter_reading.destroy
  	redirect_to sale_meter_readings_path, gflash: { success: 'Meter Reading deleted successfully'}
  end

  private
  def startup
  	@sale_meter_reading = SaleMeterReading.find(params[:id])
  end

  
end
