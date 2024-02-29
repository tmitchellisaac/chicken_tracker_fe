class Shelter
  attr_reader :id, :name, :user_id

  def initialize(attr)
    # binding.pry

    # this works in shelter_spec.rb
      @id = attr[:data][:id].to_i
      @name = attr[:data][:attributes][:name]
      @user_id = attr[:data][:attributes][:user_id].to_i

    # this works in new_animal_spec.rb
      # @id = attr[:id].to_i
      # @name = attr[:attributes][:name]
      # @user_id = attr[:attributes][:user_id].to_i

    # this works in edit_animal_spec.rb
      # @id = attr[:id].to_i
      # @name = attr[:attributes][:name]
      # @user_id = attr[:attributes][:user_id]
  end
end