class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to root_path # need to update to home path when that route exists
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_digest, :shelters)
  end
end