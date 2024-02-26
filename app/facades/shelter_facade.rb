class ShelterFacade
  def initialize(params)
    @shelter_id = params[:id]
  end

  def shelter
    service = ShelterService.new
    # this needs to be made dynamic
    shelter = Shelter.new(service.get_shelter(@shelter_id)[:data])
  end
end