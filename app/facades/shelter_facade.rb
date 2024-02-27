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
end