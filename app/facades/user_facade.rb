class UserFacade

  def initialize(params)
    @params = params
  end


  def user
    user = User.find(@params[:id])
  end

  def shelters
    service = ShelterService.new
    service.get_shelters(@params[:id]).map do |shelter_data|
      Shelter.new(shelter_data)
    end
  end

end