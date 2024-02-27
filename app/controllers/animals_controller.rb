class AnimalsController < ApplicationController
  
  def new
    @allowed_species = allowed_species
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

  private

  # this heavyweight method allows for a collection dropdown in the view
  def allowed_species
    [
      { id: 1, name: "Chicken" },
      { id: 2, name: "Bee" },
    ].map { |species| OpenStruct.new(species) }
  end
end