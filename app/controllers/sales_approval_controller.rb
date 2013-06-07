class SalesApprovalController < ApplicationController
  load_and_authorize_resource

  before_filter :startup, except: [:index]

  def index
  	#@sale_meter_readings = SaleMeterReading.all
    @sale_meter_readings = SaleMeterReading.with_pump  || []
  end

  def show
  	#@sale_meter_reading = SaleMeterReading.find(params[:id])
  end

  def edit
  	#@sale_meter_reading = SaleMeterReading.find(params[:id])
  end

  def update
  	
  	if @sale_meter_reading.update_attributes(params[:sale_meter_reading])
		#save SD and assign to sale
		#perform stock calculation only if it is approved
	  	if @sale_meter_reading.is_approved?
	  		@sale_meter_reading.stock_deduction = calculate_stock_deduction
	  	end

  		redirect_to list_sales_approval_path, gflash: {success: 'Stock Deduction updated successfully'}
  	else
  		@sale_meter_reading.is_approved = false
  		render action: 'edit', gflash: {error: 'Stock Deduction could not be updated, check values'}
  	end
  end

  private
  def startup
  	@sale_meter_reading = SaleMeterReading.find(params[:id])
  end

  def calculate_stock_deduction
  	#@sale_meter_reading = SaleMeterReading.find(params[:id])

  	#identify and set tank
  	tank = @sale_meter_reading.pump.tank

  	#find latest stock of tank (call scope)
  	#if stock does not exist for the tank, alert
  	#and create new instance of stock
  	previous_stock_deduction = StockDeduction.latest_deduction(tank.id).first
  	#puts previous_stock_deduction.to_s

  	new_stock_deduction = StockDeduction.new

  	if previous_stock_deduction.nil?
  		#if no previous stock, assume the tank is full
  		new_stock_deduction.calculate_deduction(@sale_meter_reading.liters_sold, tank.capacity)
	else
		new_stock_deduction.calculate_deduction(@sale_meter_reading.liters_sold, previous_stock_deduction.current_quantity)
  	end
  	
  	#create new stock, setting the current volume of the tank
  	stock = Stock.new
  	stock.tank = tank
  	stock.current_stock = new_stock_deduction.current_quantity

  	#add sale_meter_reading, tank and stock to the deduction
  	#return 
  	new_stock_deduction.sale_meter_reading = @sale_meter_reading
  	new_stock_deduction.tank = tank
  	new_stock_deduction.stock = stock

  	new_stock_deduction.save

  	new_stock_deduction

  	  	#puts previous_stock_deduction.id

  	#@sale_meter_reading.stock_deduction = StockDeduction.latest_deduction(@sale_meter_reading.pump.tank_id)

  	#pass parameters to SD method to perform calculation
  end
end
