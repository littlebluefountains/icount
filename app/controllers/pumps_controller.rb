class PumpsController < ApplicationController
before_filter :startup, except: [:index, :create, :new]

  def index
  	@pumps = Pump.all
  end

  def show
  end

  def edit
  end

  def new
  	@pump = Pump.new
  end

  def create
  	@pump = Pump.new(params[:pump])

  	if @pump.save
  		redirect_to pumps_path, gflash: {success: 'Pump saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @pump.update_attributes(params[:pump])
  		redirect_to pumps_path, gflash: {success: 'Pump updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@pump.destroy
  	redirect_to pumps_path, gflash: {success: 'Pump deleted successfully'}
  end


  private
  def startup
  	@pump = Pump.find(params[:id])
  end
end
