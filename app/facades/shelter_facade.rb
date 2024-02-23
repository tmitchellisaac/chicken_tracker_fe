class ShelterFacade
  def initialize(params)
    @shelter_id = params[:id]
  end

  def shelter
    service = ShelterService.new
    shelter = Shelter.new(service.get_shelter(1)[:data])
  end
end