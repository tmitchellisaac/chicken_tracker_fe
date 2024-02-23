class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_out
    session[:user_id] = nil
    flash[:alert] = "Logged out successfully"
  end
end