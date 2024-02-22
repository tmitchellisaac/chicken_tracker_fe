class SessionsController < ApplicationController
  def destroy
    reset_session
    flash[:success] = "Logged out successfully"
  end
end