class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    helper_method :current_user
  
  def current_user
  	if session[:user_id]
	    @current_user ||= User.find_by(id: session[:user_id])
  	end
  end

  def share_variables
    Thread.current[:current_user] = current_user
    # Thread.current[:current_ip] = request.remote_ip
  end

  def authenticate_user
    redirect_to authentications_url unless @current_user
  end
end