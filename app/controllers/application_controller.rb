class ApplicationController < ActionController::Base

  
# def
#   @allowed_species = ["chicken", "bee"]
# end

  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logout
    session[:user_id] = nil
    flash[:alert] = "Logged out successfully"
  end
end

