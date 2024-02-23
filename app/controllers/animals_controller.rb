class AnimalsController < ApplicationController
  
  def new
    @allowed_species = allowed_species
  end

  def create 
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