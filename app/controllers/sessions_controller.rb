class SessionsController < ApplicationController

  def create
    user_info = request.env['omniauth.auth']
    email = user_info[:info][:email]
require 'pry'; binding.pry
    redirect_to root_path, notice: "Logged in successfully!"
  end
end