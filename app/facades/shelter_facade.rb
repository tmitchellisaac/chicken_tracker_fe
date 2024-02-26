class ShelterFacade
  attr_reader :user_id, :shelter_service
  
  def initialize(params)
    @user_id = params[:user_id]
    @shelter_service = ShelterService.new
  end

  def shelter
    shelter = Shelter.new(@shelter_service.get_shelter(@shelter_id)[:data])
  end

  def create_shelter(new_shelter_data)
    Shelter.new(@shelter_service.create_shelter(new_shelter_data)[:data])
  end
end