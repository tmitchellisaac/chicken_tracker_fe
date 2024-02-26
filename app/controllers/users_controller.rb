class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end


  def create 
    if user_params[:password] != user_params[:password_confirmation]
      flash[:error] = "Password and password confirmation do not match."
      redirect_to new_user_path
    else
      user = User.create(user_params)
      if user.save
        session[:user_id] = user.id
        flash[:success] = "Welcome!"
        redirect_to "/users/#{user.id}"
      else  
        flash[:error] = "Unable to create user. Please try again"
        render :new
      end 
    end
  end

  def login_form
    render :login_form
  end

  def log_in
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Authentication successful
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
      
    else
      # Authentication failed
      flash[:alert] = "Unable to log in. Please try again."
      render :login_form
    end
  end
  
  private
  def user_params
    # params.require(:user).permit(:email, :password_digest)
    params.permit(:email, :password, :password_confirmation)
  end
end