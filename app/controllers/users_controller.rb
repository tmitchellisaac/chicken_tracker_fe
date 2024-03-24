class UsersController < ApplicationController
  def show
    @facade = UserFacade.new(params)
    @meetings = SingleDayEvent.where(user_id: params[:id])
    @filters = params[:filter]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if user_params[:password] != user_params[:password_confirmation]
      flash.now[:error] = "User not created. Please ensure password and password confirmation match."

      redirect_to new_user_path
    else
      user = User.create(user_params)
      if user.save
        session[:user_id] = user.id
        flash.now[:success] = "Welcome!"
        redirect_to "/users/#{user.id}"
      else
        flash.now[:error] = "Unable to create user. Please try again."
        render :new
      end
    end
  end

  def login_form
    flash.now[:alert] = "Unable to log in. Please try again."
    render :login_form
  end

  def log_in
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      flash.now[:notice] = "You've logged in successfully!"
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      # Authentication failed
      flash.now[:alert] = "Unable to log in. Please try again."
      render :login_form
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    # params.permit(:email, :password, :password_confirmation)
  end
end
