class StationsController < ApplicationController
  load_and_authorize_resource

  before_filter :startup, except: [:index, :create, :new]

  def index
  	@stations = Station.all
  end

  def show
  end

  def edit
  end

  def new
  	@station = Station.new
  end

  def create
  	@station = Station.new(params[:station])

  	if @station.save
  		redirect_to stations_path, gflash: {success: 'Station saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @station.update_attributes(params[:station])
  		redirect_to stations_path, gflash: {success: 'Station updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@station.destroy
  	redirect_to stations_path, gflash: {success: 'Station deleted successfully'}
  end


  private
  def startup
  	@station = Station.find(params[:id])
  end
end
