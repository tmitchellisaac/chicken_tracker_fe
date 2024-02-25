class Animal
  attr_reader :id, :name, :species, :birthday, :color

  def initialize(attr)
    @id = attr[:id]
    @name = attr[:attributes][:name]
    @species = attr[:attributes][:species]
    @birthday = attr[:attributes][:birthday]
    @color = attr[:attributes][:color]
  end
end