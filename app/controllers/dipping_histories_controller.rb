class DippingHistoriesController < ApplicationController
	before_filter :startup, except: [:index, :create, :new]
  #before_filter :update_product_price, only: [:create, :update]
  require 'sms_notifier'

  def index
  	@dipping_histories = DippingHistory.all
  end

  def show
  end

  def edit
  end

  def new
  	@dipping_history = DippingHistory.new
  end

  def create
  	@dipping_history = DippingHistory.new(params[:dipping_history])

  	if @dipping_history.save
  		redirect_to dipping_histories_path, gflash: {success: 'DippingHistory saved successfully'}

  		#sms sms to all registered users
      	SmsNotifier::dipping_sms_summary @dipping_history
      
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @dipping_history.update_attributes(params[:dipping_history])
  		redirect_to dipping_histories_path, gflash: {success: 'DippingHistory updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@dipping_history.destroy
  	redirect_to dipping_histories_path, gflash: {success: 'DippingHistory deleted successfully'}
  end


  private
  def startup
  	@dipping_history = DippingHistory.find(params[:id])
  end
end
