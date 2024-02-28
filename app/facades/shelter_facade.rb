class ShelterFacade
  attr_reader :params, :id, :name, :user_id, :shelter_service
  
  def initialize(params)
    @params = params
    @id = params[:id]
    @name = params[:name]
    @user_id = params[:user_id]
    @shelter_service = ShelterService.new
  end

  def shelter
    shelter = @shelter_service.get_shelter(@id)[:data]
    Shelter.new(shelter)
  end

  def update_shelter(updated_data)
    # shelter = @shelter_service.update_shelter(updated_data)
    # Shelter.new(shelter)

    shelter = Shelter.new(@shelter_service.update_shelter(updated_data, id)[:data])
  end

  # def update_animal(data)
  #   animal = Animal.new(@animal_service.update_animal_service(data, id)[:data])
  # end
end