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
    if attr[:attributes]
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
    else
      @id = attr[:id]
      @name = attr[:name]
      @species = attr[:species]
      @birthday = attr[:birthday]
      @color = attr[:color]
      @main_prey = attr[:main_prey]
      @habitat = attr[:habitat]
      @diet = attr[:diet]
      @skin_type = attr[:skin_type]
      @top_speed = attr[:top_speed]
      @avg_litter = attr[:avg_litter]
      @lifespan = attr[:lifespan]
      @weight = attr[:weight]
      @lifestyle = attr[:lifestyle]
      @fav_food = attr[:fav_food]
      @shelter_id = attr[:shelter_id]
    end
  end

  def attributes_match?(params_hash)
    self.shelter_id.to_i == params_hash[:shelter_id] &&
    self.name == params_hash[:name] &&
    self.species == params_hash[:species] &&
    self.color == params_hash[:color] &&
    self.birthday == params_hash[:birthday]
  end

  def age(today)
    birthday = DateTime.parse(self.birthday)
    if birthday > today
      "Error, the animal hasn't been born yet"
    else
      days = age_in_days(today, birthday)
      months = age_in_months(today, birthday)
      years = age_in_years(today, birthday)

      "#{years} year(s), #{months} month(s), #{days} day(s)"
    end
  end

  def days_in_month(month)
    days_in_month = {
      1 => 31,
      2 => 28,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31,
    }
    today = DateTime.now
    if Date.leap?(today.year)
      days_in_month[2] = 29
    end
    days_in_month[month]
  end

  def age_in_days(today, birthday)
    case birthday.day
    when today.day
      days = 0
    when 1..today.day
      days = today.day - birthday.day
    when today.day..31
      previous_month_total = days_in_month(today.month - 1)
      days_left_in_previous_month = previous_month_total - birthday.day
      days = today.day + days_left_in_previous_month
    end
  end

  def age_in_months(today, birthday)
    case birthday.month
    when today.month
      today.day >= birthday.day ? months = 0 : months = 11
    when 1..today.month
      today.day >= birthday.day ? months = 0 : months = -1
      months = months + today.month - birthday.month
    when today.month..12
      today.day >= birthday.day ? months = 12 : months = 11
      months = months + (today.month - birthday.month)
    end
    months
  end

  def age_in_years(today, birthday)
    years = today.year - birthday.year
    if (birthday.month == today.month && birthday.day > today.day) || birthday.month > today.month
      years -= 1
    else
      years
    end
  end
end
