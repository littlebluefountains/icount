class EmployeesController < ApplicationController
before_filter :startup, except: [:index, :create, :new]

  def index
  	@employees = Employee.all
  end

  def show
  end

  def edit
  end

  def new
  	@employee = Employee.new
  end

  def create
  	@employee = Employee.create(params[:employee])

  	if @employee.save
  		redirect_to employees_path, gflash: {success: 'Employee saved successfully'}
  	else
  		render action: 'edit'
  	end
  end

  def update
  	if @employee.update_attributes(params[:employee])
  		redirect_to employees_path, gflash: {success: 'Employee updated successfully'}
  	else
  		render action: 'edit'	
  	end
  end

  def destroy
  	@employee.destroy
  	redirect_to employees_path, gflash: {success: 'Employee deleted successfully'}
  end


  private
  def startup
  	@employee = Employee.find(params[:id])
  end
end
