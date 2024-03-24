class ApplicationController < ActionController::Base
  before_action :check_session_timeout
  helper_method :current_user

  def current_user
    @_current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_out
    reset_session # inbuilt RoR method
    flash.now[:alert] = "Logged out successfully"
    # redirect_to log_in_path
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  private

  def validate_user
    unless current_user
      flash[:alert] = "Please log in to view this page"
      redirect_to log_in_path
    end
  end

  def restrict_access
    unless current_user.id == params[:id].to_i
      flash[:alert] = "You are not authorized to view this page"
      redirect_to log_in_path
    end
  end

  def check_session_timeout
    if session[:user_id] && session_timed_out?
      log_out
    else
      session[:last_seen] = Time.current.to_s
    end
  end

  def session_timed_out?
    return false unless session[:last_seen]

    last_seen_time = Time.parse(session[:last_seen])
    Time.current - last_seen_time > timeout_duration
  end

  def timeout_duration
    # 10.seconds
    15.minutes
  end
end
