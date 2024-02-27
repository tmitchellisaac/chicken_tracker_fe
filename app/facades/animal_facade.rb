class AnimalFacade
  attr_reader :params, :animal_service 
  
  def initialize(params)
    @params = params
    @animal_service = AnimalService.new
  end

  def shelter_id
    @params[:shelter_id]
  end

  def animal
    Animal.new(@animal_service.get_animal(@params[:id], @params[:shelter_id])[:data])
  end

  def create_animal(animal_data)
    Animal.new(@animal_service.create_animal(animal_data)[:data])
  end
end


