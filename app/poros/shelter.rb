class Shelter
  attr_reader :id, :name, :user_id

  def initialize(attr)
    @shelter = @facade.shelter
    @id = attr[:id].to_i
    @name = attr[:attributes][:name]
    @user_id = attr[:attributes][:user_id].to_i
  end
end
