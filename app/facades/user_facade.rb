class UserFacade
  def initialize(params)
    @user_id = params[:id]
  end

  def shelters
    service = ShelterService.new
    shelters = Shelter.new(service.get_shelter(1)[:data])
  end
end