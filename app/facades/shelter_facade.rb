class ShelterFacade
  attr_reader :params, :id, :name, :user_id, :shelter_service
  
  def initialize(params)
    # binding.pry
    @params = params
    @id = params[:id].to_i
    @name = params[:name]
    @user_id = params[:user_id]
    @shelter_service = ShelterService.new
  end

  def get_shelter
    get_shelter_service = @shelter_service.get_shelter(@id)[:data] # I think this is wrong
    # binding.pry
    shelter_poro = Shelter.new(get_shelter_service)
  end

  def create_shelter(new_shelter_data)
    create_shelter_service = @shelter_service.create_shelter(new_shelter_data)
    shelter_poro = Shelter.new(create_shelter_service)
  end

  def update_shelter(updated_shelter_data)
    update_shelter_service = @shelter_service.update_shelter(updated_shelter_data, params[:id].to_i)[:data]
    # shelter_poro = Shelter.new(update_shelter_service)
  end
end