class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to "/home"
  end

  def login_form
    render :login_form
  end

  def log_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Authentication successful
      session[:user_id] = user.id
      redirect_to "/home"
    else
      # Authentication failed
      flash[:error] = "Unable to log in. Please try again."
      render :login_form
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :password_digest, :shelters)
  end
end