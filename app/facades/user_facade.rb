class UserFacade
  attr_reader :user_id

  def initialize(params)
    @params = params
    @user_id = params[:id]
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

  def animal_total
    service = ShelterService.new
    shelters = service.get_shelters(@params[:id]).map do |shelter_data|
      Shelter.new(shelter_data)
    end
    array = []
    shelters.each do |shelter|
      array << shelter.animals.count
    end
    array.sum
  end

  def animals_by_species
    service = ShelterService.new
    service.get_shelters(@params[:id]).map do |shelter_data|
      Shelter.new(shelter_data)
    end
    array = []
    shelters.each do |shelter|
      shelter.animals.each do |animal|
      array << animal.species
      end
    end
    array.uniq
  end



  def meetings
    single = SingleDayEvent.where(user_id: @params[:id])
    multi = MultiDayEvent.where(user_id: @params[:id])
    [single, multi].flatten
  end

end