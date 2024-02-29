class ShelterFacade
  attr_reader :params, :id, :name, :user_id, :shelter_service
  
  def initialize(params)
    @params = params
    @id = params[:id]
    @name = params[:name]
    @user_id = params[:user_id]
    @shelter_service = ShelterService.new
  end
  
  def animal
    Animal.new(@animal_service.get_animal(@params[:id], @params[:shelter_id])[:data])
  end

  def user_shelters
    shelters_data = @shelter_service.get_shelters(@user_id)
    shelters_data.map { |shelter| Shelter.new(shelter) }
  end

  def shelter
    get_shelter_service = @shelter_service.get_shelter(@id)[:data]
    
    shelter_poros = Shelter.new(get_shelter_service)
  end

  def update_shelter(updated_shelter_data)
    shelter = Shelter.new(@shelter_service.update_shelter(updated_shelter_data, params[:id].to_i)[:data]) # is this the best place to convert .to_i ?

    #### this is where the error is
  end

  def animals
    animals = []
    @shelter_service.get_animals(@id).map do |animal|
      animals << Animal.new(animal)
    end
    animals
  end
end