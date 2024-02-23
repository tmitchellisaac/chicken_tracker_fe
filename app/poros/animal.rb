class Animal
  attr_reader :id, :name, :species, :birthday, :color

  def initialize(attr)
    @id = attr[:id]
    @name = attr[:attributes][:name]
    @name = attr[:attributes][:species]
    @name = attr[:attributes][:birthday]
    @name = attr[:attributes][:color]
  end
end