class ApplicationController < ActionController::Base

  protect_from_forgery

  #from Railscasts - should be obviated by setting config.middleware.use 'Apartment::Elevators::Subdomain'
  #around_filter :scope_current_tenant

  def after_sign_out_path_for(user)
  	new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, alert: exception.message
  end

  private 

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
