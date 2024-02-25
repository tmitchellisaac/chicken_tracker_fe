class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
  end

  def new
    @shelter = Shelter.new(params)
    # send a post request to BE to create the shelter in the DB
    if response.status == 200
      redirect_to user_path(User.find(@shelter.user_id)) 
      # I think this will work if they click the Bew Shelter button from the user_path, but it might not work if they just navigate to "/shelters/new"
      flash[:success] = "Shelter created"
    else
      flash[:error] = "Shelter not created."
    end
  end
end