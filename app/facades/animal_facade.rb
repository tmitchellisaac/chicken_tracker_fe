class AnimalFacade
  attr_reader :params, :animal_service

  def initialize(params)
    @params = params
    @animal_service = AnimalService.new
  end

  def id
    @params[:id]
  end

  def shelter_id
    @params[:shelter_id]
  end

  def allowed_species
      [
        { id: 1, name: "Chicken" },
        { id: 2, name: "Bee" },
        { id: 3, name: "Goat" },
        { id: 4, name: "Sheep" },
        { id: 5, name: "Rabbit" },
        { id: 6, name: "Duck" },
        { id: 7, name: "Pig" },
        { id: 8, name: "Geese" },
        { id: 9, name: "Horse" }
      ].map { |species| OpenStruct.new(species) }
  end

  def animal
    Animal.new(@animal_service.get_animal_service(@params[:id], @params[:shelter_id]))
  end

  def create_animal(animal_data)
    Animal.new(@animal_service.create_animal_service(animal_data)[:data])
  end

  def update_animal(data)
    animal = Animal.new(@animal_service.update_animal_service(data, id)[:data])
  end

  def delete_animal
    @animal_service.delete_animal(@params[:id], @params[:shelter_id])
  end
end
