class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_out_path_for(user)
  	new_user_session_path
  end

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to root_path, alert: exception.message
  end

end
