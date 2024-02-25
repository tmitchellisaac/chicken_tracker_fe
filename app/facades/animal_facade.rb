class AnimalFacade
  def initialize(params)
    @params = params
  end

  def shelter_id
    @params[:shelter_id]
  end

  def animal
    service = AnimalService.new
    Animal.new(service.get_animal(@params[:id])[:data].first)
  end

  def create_animal(animal_data)
    service = AnimalService.new
    animal = Animal.new(service.create_animal(animal_data)[:data].first)
  end

end