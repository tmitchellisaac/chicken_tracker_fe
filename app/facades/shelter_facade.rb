class ShelterFacade
  attr_reader :params, :id, :name, :user_id, :shelter_service
  
  def initialize(params)
    @params = params
    @id = params[:id]
    @name = params[:name]
    @user_id = params[:user_id]
    @shelter_service = ShelterService.new
  end
  
  def animal
    Animal.new(@animal_service.get_animal(@params[:id], @params[:shelter_id])[:data])
  end

  def shelter
    get_shelter_service = @shelter_service.get_shelter(@id)[:data] # i need to pass in ID here instead of the whole hash
    
    shelter_poros = Shelter.new(get_shelter_service)

    # binding.pry
    # get_shelter_service
    # => {:id=>"1", :type=>"shelter", :attributes=>{:name=>"red barn", :user_id=>"1"}, :relationships=>{:animals=>{:data=>[]}}}

    # shelter_poros
    # => #<Shelter:0x000000010b99bc70 @id="1", @name="red barn", @user_id="1">

    # @shelter_service.get_shelter(@id)[:data]
    # => {:id=>"1", :type=>"shelter", :attributes=>{:name=>"red barn", :user_id=>"1"}, :relationships=>{:animals=>{:data=>[]}}}
    
    # @shelter_service.get_shelter(@id)[:data][:id]
    # => "1"

    # @shelter_service.get_shelter(@id)[:data][:id].to_i
    # => 1
    # ^this is what should get passed to @shelter_service.get_shelter()
  end

  def update_shelter(updated_shelter_data)
    shelter = Shelter.new(@shelter_service.update_shelter(updated_shelter_data, params[:id].to_i)[:data]) # is this the best place to convert .to_i ?
  end
end