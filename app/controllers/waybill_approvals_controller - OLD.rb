class WaybillApprovalsController < ApplicationController
	load_and_authorize_resource

  before_filter :startup, except: [:index]
  def index
  	@waybill_approvals = Waybill.includes(:stock_additions).all
  end

  def edit
  	#find the waybill
  	#set its approved field to true
  	#@waybill_approval.approved = true

  	#find the tanks for the target station that contain the supplied product
  	#@tank = Tank.where(:station_id => @waybill_approval.station_id && :product_id => @waybill_approval.product_id )
  	@tanks = Tank.by_station(@waybill_approval.station_id).by_product(@waybill_approval.product_id)

  	#build nested model
  	@waybill_approval.stock_additions.build
  end

  def show
  end

  def update
  	err_message = ""

  	#perform save
  	if @waybill_approval.update(params[:waybill_approval])
  		validate_stock_addition(err_message)
  		if err_message == ""
  			@waybill_approval.approved = true
  			redirect_to waybill_approvals_path, flash: {  success: 'Approval and Disbursement successful'}
  		else
  			@waybill_approval.approved = false
  			render action: 'edit'
  		end
  	end
  end

  private
  def startup
  	@waybill_approval = Waybill.find(params[:id])
  end

  #add a callback that is called before_update
  def validate_stock_addition(err_message)
  	#verify that Stock_additions is valid
  	#1. Get most recent stock for selected tank
  	#2. Assign volume of recent stock to temporary variable
  	#3. Verify that quantity_added does not exceed quantity_supplied
  	#4. Verify that quantity_added + recent_stock does not exceed tank capacity
  	#5. If step 3 and 4 pass, create instance of Stock_addition; assign the variables
  	#   prev_qty = temporary_variable; curr_qty = quantity_added + temporary_variable;
  	#6. Create instace of Stock and assign its tank_id to selected tank
  	#   current_stock = curr_qty of stock_addition
  	@waybill_approval.stock_additions.each do |stock_addition|
  		#get recent stock for tank
  		temp_stock_value = stock_addition.tank.get_lastest_stock(tank.id)

  		#verify quantity_supplied >= quantity_added 
  		if @waybill_approval.quantity_supplied >= stock_addition.quantity_added
  			current_stock = stock_addition.quantity_added + temp_stock_value

  			#verify current_stock does not exceed tank capacity
  			if current_stock <= stock_addition.tank.capacity
  				#create instance of stock, add it to stock_addition and then save all
  				stock_addition.stock = Stock.new( tank_id: stock_addition.tank.id, current_stock: current_stock)
  				
  				stock_addition.previous_quantity = temp_stock_value
  				stock_addition.current_quantity = current_stock

  			else
  				err_message = "Current stock greater than capacity of tank"

  			end
  		else
  			err_message = "Quantity added greater than quantity supplied"
  			
  		end

  	end
  end
end
