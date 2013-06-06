class AccountsController < ApplicationController
	before_filter :startup, except: [:index, :new, :create]

	def index
		@accounts = Account.all
	end

	def new
		@account = Account.new
		@account.build_owner
	end

	def create
		@account = Account.create_with_owner(params[:account])
		if @account.valid?
			#force_authentication!(@account.owner)
			@account.create_schema
			#flash[:success] = " Your account has been successfully created."
			#redirect_to root_url(subdomain: @account.subdomain)
			redirect_to accounts_path, gflash: { success: 'Account successfully created'}
		else
			#flash[:error] = "Sorry, your account could not be created."
			gflash[:error] = "Sorry, your account could not be created."
			render :new
		end
	end


	def show
	  #@account = Account.find(params[:id])
	end

	def edit
	  #@account = Account.find(params[:id])
	  #initialize admin attributes 
	  @account.owner
	end

	def update
	   #@account = Account.find(params[:id])

	   if @account.update_attributes(params[:account])
	      redirect_to accounts_path, flash: { success: 'Account successfully updated'}
	   else
	      render action: 'edit'
	   end
	end

	 def destroy
	    #@account = Account.find(params[:id])
	    @account.destroy

	    #delete the dabase schema if the delete is successful

	    redirect_to accounts_path, flash: { success: 'account successfully deleted' }
	end

	private
	  def startup
	  	@account = Account.find(params[:id])
	  end
end
