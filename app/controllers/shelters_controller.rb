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
    shelter_poro = @facade.update_shelter(updated_shelter_data)
    
    if response.status == 200
      flash[:success] = "Shelter was successfully updated."
      redirect_to shelter_path(@shelter.id)
    else
      flash[:error] = "Error. Shelter not updated."
      render :edit
    end
  end
end