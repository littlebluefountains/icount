class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :subdomain, :current_account
  before_filter :set_logo  #, :validate_subdomain, authenticate_user!

  #from Railscasts - should be obviated by setting config.middleware.use 'Apartment::Elevators::Subdomain'
  #around_filter :scope_current_tenant

  def after_sign_out_path_for(user)
  	new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, alert: exception.message
  end

  ##from book; convert from Warden to Devise
  # def force_authentication!(user)
  #   env['warden'].set_user(user.id, :scope => :user)
  # end

  # def owner?
  #   current_account.owner?(current_user)
  # end
  # helper_method :owner?

  # def authorize_owner
  #   unless owner?
  #     flash[:error] = "You are not allowed to do that."
  #     redirect_to root_path
  #   end
  # end


  ##

  private 
    #method to set logo based on subdomain
    def set_logo
      logo = ""
      if request.subdomain.present?
        logo += request.subdomain
        logo += "_logo.png"
      else
        logo = "gal_logo.png"
      end
      #logo += "logo.png"
      # logo += "logo.jpg"
      logo = logo.to_s
    end
    helper_method :set_logo

    def current_account
      #if subdomain is www or empty, reroute to base domain
      # if subdomain == 'www' || subdomain.nil?
      #   @current_account = "home"
      # else
      #   @current_account ||= Account.find_by_subdomain!(subdomain) 
      # end
      @current_account ||= Account.find_by_subdomain!(subdomain) if subdomain.present?
    end

    def subdomain
      request.subdomain
    end

    #Will redirect the user to 404 page if the account cannot be found based on the subdomain.
    def validate_subdomain
      redirect_to '/404.html' if current_account.nil?
    end

	  # def current_system_user
	  # 	@current_system_user ||= User.find(session[:user_id]) if session[:user_id]
	  # end

	  # def current_tenant
	  # 	@current_tenant ||= Tenant.find_by_subdomain!(request.subdomain) 
	  # end
	  # helper_method :current_tenant

	  # def scope_current_tenant(&block)
	  # 	current_tenant.scope_schema("public", &block)
	  # 	#Apartment::Database.switch('#{@current_tenant.subdomain}')
	  # end

end
