class AnimalFacade
  def initialize(params)
    @animal_id = params[:id]
  end

  def animal
    service = AnimalService.new
    animal = Animal.new(service.get_animal(1)[:data])
  end
end