class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
    @shelter = @facade.shelter
  end

  def edit
    @facade = ShelterFacade.new(params)
    @shelter = @facade.shelter
  end

  def update
    updated_shelter_data = ({
      "name": params[:name],
      "user_id": params[:user_id]
    })
    
    @facade = ShelterFacade.new(params)
    @shelter = @facade.shelter
    @facade.update_shelter(updated_shelter_data)
    
    if status == 200
      flash[:success] = "Shelter was successfully updated."
      redirect_to shelter_path(@shelter.id)
    else
      flash[:error] = "Error. Shelter not updated."
      render :edit
    end
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