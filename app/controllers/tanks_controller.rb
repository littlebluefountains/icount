class TanksController < ApplicationController
  before_filter :startup, except: [:index, :create, :new]

  def index
  	@tanks = Tank.all
  end

  def show
  end

  def edit
  end

  def new
  	@tank = Tank.new
  end

  def create
  	@tank = Tank.create(params[:tank])

  	if @tank.save
  		redirect_to tanks_path, gflash: {success: 'Tank saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @tank.update_attributes(params[:tank])
  		redirect_to tanks_path, gflash: {success: 'Tank updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@tank.destroy
  	redirect_to tanks_path, gflash: {success: 'Tank deleted successfully'}
  end


  private
  def startup
  	@tank = Tank.find(params[:id])
  end
end
