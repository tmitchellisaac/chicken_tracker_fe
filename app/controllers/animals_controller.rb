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
    #create a patch request to send to the BE API that includes the updated information
    # require 'pry'; binding.pry
    updated_animal_data = ({
      "shelter_id": params[:shelter_id].to_i,
      "name": params[:name],
      "species": params[:species],
      "color": params[:color],
      "birthday": params[:birthday]
  })
    facade = AnimalFacade.new(params)
    # updated_animal = facade.update_animal(updated_animal_data)

    if facade.update_animal(updated_animal_data).attributes_match?(updated_animal_data)
      flash[:alert] = "You've successfully updated your animal!"
      redirect_to "/shelters/#{params[:shelter_id]}/animals/#{params[:id]}"
    else
      flash[:alert] = "Sorry, something went wrong"
      render :edit
    end
  end


  private

  # moved to AnimalFacade-- this heavyweight method allows for a collection dropdown in the view
  # def allowed_species
  #   [
  #     { id: 1, name: "Chicken" },
  #     { id: 2, name: "Bee" },
  #   ].map { |species| OpenStruct.new(species) }
  # end

end