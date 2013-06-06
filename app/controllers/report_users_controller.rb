class ReportUsersController < ApplicationController
	load_and_authorize_resource
	
	before_filter :startup, except: [:index, :new, :create]

	def index
		@report_users = ReportUser.all
	end

	def new
		@report_user = ReportUser.new
	end

	def edit	
	end

	def show	
	end

	def update

		if @report_user.update_attributes(params[:report_user])
			redirect_to report_users_path, gflash: {success: 'User updated successfully'}
		else
			render 'edit'
		end
	end

	def create
		@report_user = ReportUser.new(params[:report_user])

		if @report_user.save
			redirect_to report_users_path, gflash: {success: 'User saved successfully'}
		else
			render 'edit'
		end
	end

	def destroy
		@report_user.destroy
		redirect_to report_users_path, gflash: {success: 'User deleted successfully'}
	end

	private 
	def startup
		@report_user = ReportUser.find(params[:id])
	end
end
