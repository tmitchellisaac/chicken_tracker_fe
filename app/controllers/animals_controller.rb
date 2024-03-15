class AnimalsController < ApplicationController
  
  def new
    @facade = AnimalFacade.new(params)
  end

  def create 
    new_animal_data = ({
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:name],
      "species": params[:species],
      "color": params[:color],
      "birthday": params[:birthday]
  })
    facade = AnimalFacade.new(params)
    new_animal = facade.create_animal(new_animal_data)
    if new_animal != nil 
      flash[:alert] = "Animal successfully created"
      redirect_to "/shelters/#{new_animal.shelter_id}/animals/#{new_animal.id}"
    else
      flash[:alert] = "Animal not created, try again"
      render :new
    end
  end

  def show
    @facade = AnimalFacade.new(params)
  end

  def edit
    @facade = AnimalFacade.new(params)
  end

  def update
    updated_animal_data = ({
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:name],
      "species": params[:species],
      "color": params[:color],
      "birthday": params[:birthday]
  })
    facade = AnimalFacade.new(params)
    if facade.update_animal(updated_animal_data).attributes_match?(updated_animal_data)
      flash[:alert] = "You've successfully updated your animal!"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"
    else
      flash[:alert] = "Sorry, something went wrong"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"

    end
  end

  def destroy
    if AnimalFacade.new(params).delete_animal == 204
      flash[:alert] = "Animal successfully deleted"
      redirect_to "/shelters/#{params[:shelter_id]}"
    else
      flash[:alert] = "Something went wrong please try again"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"
    end
  end

  private
  
end