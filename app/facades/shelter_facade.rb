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
    get_shelter_service = @shelter_service.get_shelter(@id)[:data]
    
    shelter_poros = Shelter.new(get_shelter_service)
  end

  def update_shelter(updated_shelter_data)
    response = @shelter_service.update_shelter(updated_shelter_data, params[:id].to_i) # is this the best place to convert .to_i ?

    #### this is where the error is
  end
end