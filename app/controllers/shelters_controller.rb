class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
  end

  def new
    @facade = ShelterFacade.new(params)
  end
  
  def create
    new_shelter_data = {
      "shelter": {
        "name": params[:name],
        "user_id": params[:user_id]
      }
    }
    # binding.pry

    facade = ShelterFacade.new(params)
    new_shelter = facade.create_shelter(new_shelter_data)

    if new_shelter != nil 
      flash[:success] = "Shelter successfully created"
      redirect_to "/shelters/#{new_shelter.id}"
    else
      flash[:error] = "Shelter not created, try again."
      render :new
    end
  end
end