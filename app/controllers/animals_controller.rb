class AnimalsController < ApplicationController
  
  def new
    @allowed_species = allowed_species
  end

  def create 
  end

  private

  def allowed_species
    [
      { id: 1, name: "Chicken" },
      { id: 2, name: "Bee" },
    ].map { |species| OpenStruct.new(species) }
  end
end