class SheltersController < ApplicationController
  def show
    @facade = ShelterFacade.new(params)
    @shelter = @facade.get_shelter
  end

  def edit
    @facade = ShelterFacade.new(params)
    @shelter = @facade.get_shelter
  end

  def update
    updated_shelter_data = ({
      "name": params[:name],
      "user_id": params[:user_id]
    })
    
    @facade = ShelterFacade.new(params)
    @shelter = @facade.get_shelter
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
      "name": params[:name],
      "user_id": params[:user_id]
    }
    # new_shelter_data = {
    #   "shelter": {
    #     "name": params[:name],
    #     "user_id": params[:user_id]
    #   }
    # }
    
    facade = ShelterFacade.new(params)
    new_shelter = facade.create_shelter(new_shelter_data)
    # binding.pry

    if new_shelter[:data] != nil && new_shelter[:data][:attributes][:name] == params[:name]
      flash[:success] = "Shelter successfully created"
      redirect_to "/shelters/#{new_shelter[:data][:id].to_i}"
    else
      flash[:error] = "Shelter not created, please try again."
      render :new
    end
  end
end