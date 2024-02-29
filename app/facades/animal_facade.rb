class AnimalFacade
  attr_reader :params, :id, :shelter_id, :animal_service
  attr_accessor :animal # not sure if this needs to be an attr_accessor
  
  def initialize(params)
    @params = params
    @id = params[:id]
    @shelter_id = params[:shelter_id]
    @animal_service = AnimalService.new
  end

  def allowed_species
  # this heavyweight method allows for a collection dropdown in the view

      [
        { id: 1, name: "Chicken" },
        { id: 2, name: "Bee" },
      ].map { |species| OpenStruct.new(species) }
  end

  def animal
    Animal.new(@animal_service.get_animal(@params[:id], @params[:shelter_id])[:data])
  end

  def create_animal(animal_data)
    Animal.new(@animal_service.create_animal(animal_data)[:data])
  end

  def update_animal(data)
    animal = Animal.new(@animal_service.update_animal_service(data, id)[:data])
  end
  
  def delete_animal
    @animal_service.delete_animal(@params[:id], @params[:shelter_id])
  end
end


