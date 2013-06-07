class WaybillApprovalsController < ApplicationController
	load_and_authorize_resource

  before_filter :startup, except: [:index]

  def index
  	#@waybill_approvals = Waybill.includes(:stock_additions).all
    @waybill_approvals = Waybill.with_station_and_product  || []
  end

  def edit

  	@tanks = Tank.by_station(@waybill_approval.station_id).by_product(@waybill_approval.product_id)

  	#build nested model
  	#@waybill_approval.stock_addition.build
  end

  def show
  end

  def update
  	err_message = ""

  	#perform save
  	if @waybill_approval.update(params[:waybill_approval])
  		if @waybill_approval.approved?
        @waybill_approval.stock_addition = validate_stock_addition(params[:tank_id])
      end

    #   validate_stock_addition(err_message)
  		# if err_message == ""
  		# 	@waybill_approval.approved = true
		  redirect_to waybill_approvals_path, flash: {  success: 'Approval and Disbursement successful'}
		else
			@waybill_approval.approved = false
			render action: 'edit', gflash: {error: 'Stock Addition could not be updated, check values'}
		end
  	
  end

  private
  def startup
  	@waybill_approval = Waybill.find(params[:id])
  end

  #add a callback that is called before_update
  #def validate_stock_addition(err_message)
  def validate_stock_addition(tank_id)
  	#verify that Stock_additions is valid
  	#1. Get most recent stock for selected tank
  	#2. Assign volume of recent stock to temporary variable
  	#3. Verify that quantity_added does not exceed quantity_supplied
  	#4. Verify that quantity_added + recent_stock does not exceed tank capacity
  	#5. If step 3 and 4 pass, create instance of Stock_addition; assign the variables
  	#   prev_qty = temporary_variable; curr_qty = quantity_added + temporary_variable;
  	#6. Create instace of Stock and assign its tank_id to selected tank
  	#   current_stock = curr_qty of stock_addition

  	#@waybill_approval.stock_additions.each do |stock_addition|
    tank = @tanks.select { |t| t.id == tank_id }
    #temp_stock_value = tank.get_lastest_stock(tank.id)
    previous_stock_addition = StockAddition.latest_addition(tank.id).first

    stock_addition = StockAddition.new
    stock_addition.tank = tank
    stock_addition.quantity_added = @waybill_approval.quantity_supplied
    stock_addition.previous_quantity = previous_stock_addition.current_quantity
    stock_addition.current_quantity = stock_addition.quantity_added + stock_addition.previous_quantity

			#verify current_stock does not exceed tank capacity
		if stock_addition.current_quantity <= tank.capacity
			
      #create instance of stock, add it to stock_addition and then save all
			stock_addition.stock = Stock.new( tank_id: stock_addition.tank.id, current_stock: current_stock)
			stock_addition.waybill = @waybill_approval

		else
			err_message = "Current stock greater than capacity of tank"

		end

    stock_addition.save

    stock_addition
		
  end

  #pass in the id of the selected tank from the drop down
  # def calculate_stock_addition(tank_id)

  #   #identify and set tank
  #   tank = @tanks.select { |t| t.id == tank_id }


  #   #find latest stock of tank (call scope)
  #   #if stock does not exist for the tank, alert
  #   #and create new instance of stock
  #   previous_stock_addition = StockAddition.latest_addition(tank.id).first
  #   #puts previous_stock_deduction.to_s

  #   new_stock_addition = StockAddition.new

  #   if previous_stock_addition.nil?
  #     #if no previous stock, assume the tank is full
  #     new_stock_addition.calculate_addition(@sale_meter_reading.liters_sold, tank.capacity)
  # else
  #   new_stock_addition.calculate_deduction(@sale_meter_reading.liters_sold, previous_stock_deduction.current_quantity)
  #   end
    
  #   #create new stock, setting the current volume of the tank
  #   stock = Stock.new
  #   stock.tank = tank
  #   stock.current_stock = new_stock_addition.current_quantity

  #   #add sale_meter_reading, tank and stock to the deduction
  #   #return 
  #   new_stock_addition.sale_meter_reading = @sale_meter_reading
  #   new_stock_addition.tank = tank
  #   new_stock_addition.stock = stock

  #   new_stock_addition.save

  #   new_stock_addition

  #       #puts previous_stock_deduction.id

  #   #@sale_meter_reading.stock_deduction = StockDeduction.latest_deduction(@sale_meter_reading.pump.tank_id)

  #   #pass parameters to SD method to perform calculation
  # end
end
