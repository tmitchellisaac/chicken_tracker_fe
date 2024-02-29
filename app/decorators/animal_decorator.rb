class AnimalDecorator < Draper::Decorator
  delegate_all

  def formatted_birthday
    object.birthday.to_date.strftime('%B %d, %Y')
  end

  def chicken_image
    ActionController::Base.helpers.image_tag("chicken.jpeg", alt: "Chicken", size: "50x50") if object.species == "Chicken"
  end

  def bee_image
    ActionController::Base.helpers.image_tag("bee.jpeg", alt: "Bee", size: "50x50") if object.species == "Bee"
  end

  # def animal_image
  #   ActionController::Base.helpers.image_tag("chicken.jpeg", alt: "Chicken", size: "50x50") if object.species == "Chicken"
  #   ActionController::Base.helpers.image_tag("bee.jpeg", alt: "Bee", size: "50x50") if object.species == "Bee"
  # end
end