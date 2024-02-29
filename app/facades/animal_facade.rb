class AnimalFacade
  attr_reader :params, :animal_service
  attr_accessor :animal # trying this in case it resolves bugs, but it might just need to be an attr_reader
  
  def initialize(params)
    @params = params
    @animal_service = AnimalService.new
    # @animal = @animal_service.get_animal(params[:id], params[:shelter_id][:data])
    @animal = @animal_service.get_animal(params[:id], params[:shelter_id])
  end

  def id
    @params[:id]
  end

  def shelter_id
    @params[:shelter_id]
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


