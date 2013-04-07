class ZonesController < ApplicationController
  before_filter :startup, except: [:index, :create, :new]

  def index
  	@zones = Zone.all
  end

  def show
  end

  def edit
  end

  def new
  	@zone = Zone.new
  end

  def create
  	@zone = Zone.create(params[:zone])

  	if @zone.save
  		redirect_to zones_path, gflash: {success: 'Zone saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @zone.update_attributes(params[:zone])
  		redirect_to zones_path, gflash: {success: 'Zone updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@zone.destroy
  	redirect_to zones_path, gflash: {success: 'Zone deleted successfully'}
  end


  private
  def startup
  	@zone = Zone.find(params[:id])
  end
end
