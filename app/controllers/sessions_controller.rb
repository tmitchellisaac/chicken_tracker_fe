class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    email = user_info[:info][:email]
    # require 'pry'; binding.pry
    if user = User.find_by(email: email)
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}", notice: "Logged in successfully!"
    else
      redirect_to "/users/new"
      flash[:alert] = "Please register with Chicken Tracker before logging in with Google"
    end
  end
end
