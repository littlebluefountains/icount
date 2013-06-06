class WaybillsController < ApplicationController
  #include SmsNotifier
  require 'sms_notifier'

  load_and_authorize_resource

  before_filter :startup, except: [:index, :create, :new]

  def index
  	@waybills = Waybill.all
  end

  def show
  end

  def edit
  end

  def new
  	@waybill = Waybill.new
  end

  def create
  	@waybill = Waybill.new(params[:waybill])

  	if @waybill.save
  		redirect_to waybills_path, gflash: { success: 'Waybill has been successfully created'}

      #sms sms to all registered users
      SmsNotifier::supply_sms_summary @waybill
      #supply_sms_summary @waybill
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @waybill.update_attributes(params[:waybill])
  		redirect_to waybills_path, gflash: { success: 'Waybill has been successfully updated' }
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@waybill.destroy
  	redirect_to waybills_path, gflash: { success: 'Waybill has been successfully deleted'}
  end


  private
  def startup
  	@waybill = Waybill.find(params[:id])
  end
end
