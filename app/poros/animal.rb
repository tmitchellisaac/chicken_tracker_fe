class Animal
  attr_reader :id,
              :name,
              :species,
              :birthday,
              :color,
              :main_prey,
              :habitat,
              :diet,
              :top_speed,
              :avg_litter,
              :lifespan,
              :weight,
              :lifestyle,
              :shelter_id,
              :skin_type,
              :fav_food,
              :species

  def initialize(attr)
    if attr.nil? || attr[:id].nil?
      return
    else
      @id = attr[:id]
      @name = attr[:attributes][:name]
      @species = attr[:attributes][:species]
      @birthday = attr[:attributes][:birthday]
      @color = attr[:attributes][:color]
      @main_prey = attr[:attributes][:main_prey]
      @habitat = attr[:attributes][:habitat]
      @diet = attr[:attributes][:diet]
      @skin_type = attr[:attributes][:skin_type]
      @top_speed = attr[:attributes][:top_speed]
      @avg_litter = attr[:attributes][:avg_litter]
      @lifespan = attr[:attributes][:lifespan]
      @weight = attr[:attributes][:weight]
      @lifestyle = attr[:attributes][:lifestyle]
      @fav_food = attr[:attributes][:fav_food]
      @shelter_id = attr[:relationships][:shelter][:data][:id]
    end
  end

  def attributes_match?(params_hash)
    self.shelter_id.to_i == params_hash[:shelter_id] &&
    self.name == params_hash[:name] &&
    self.species == params_hash[:species] &&
    self.color == params_hash[:color] &&
    self.birthday == params_hash[:birthday]
  end
end
