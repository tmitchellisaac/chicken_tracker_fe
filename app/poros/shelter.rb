class Shelter
  attr_reader :id, :name, :user_id

  # def initialize(attr) # attr is an array, expected a hash
  
  #   @id = attr[:id].to_i
  #   @name = attr[:attributes][:name]
  #   @user_id = attr[:attributes][:user_id].to_i
  # end

  def initialize(attr)
    shelter_data = attr.first

    @id = shelter_data[:id].to_i
    @name = shelter_data[:attributes][:name]
    @user_id = shelter_data[:attributes][:user_id].to_i
  end

  # def initialize(attr)
  #   @id = attr[0][:id]
  #   @name = attr[0][:attributes][:name]
  #   @user_id = attr[0][:attributes][:user_id]
  # end

end