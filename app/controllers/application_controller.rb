class ApplicationController < ActionController::Base
  protect_from_forgery

   def not_authenticated
    redirect_to new_session_path, :alert => "Please login first or Sign Up."
  end
  
private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

end
