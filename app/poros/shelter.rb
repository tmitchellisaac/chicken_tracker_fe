class Shelter
  attr_reader :name

  def initialize(attr)
    # require "pry"; binding.pry
    @id = attr[:id]
    @name = attr[:attributes][:name]
  end
end