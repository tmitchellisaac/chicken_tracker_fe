class AnimalFacade
  attr_reader :params, :shelter_id, :animal_service 
  
  def initialize(params)
    @params = params
    @shelter_id = params[:shelter_id]
    @animal_service = AnimalService.new
  end

  def animal
    Animal.new(@animal_service.get_animal(@params[:id], @params[:shelter_id])[:data])
  end

  def create_animal(animal_data)
    Animal.new(@animal_service.create_animal(animal_data)[:data])
  end
end


