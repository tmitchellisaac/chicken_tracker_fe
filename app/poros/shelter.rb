class Shelter
  attr_reader :id, :name

  def initialize(attr)
    @id = attr[:id]
    @name = attr[:attributes][:name]
  end
end