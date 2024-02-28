require 'rails_helper'

RSpec.describe AnimalDecorator do
  describe '#formatted_birthday' do
  it 'formats the birthday attribute' do
    # animal = Animal.new(birthday: '2023-03-03')

  animal = Animal.new({
    "id": "1",
    "type": "animal",
    "attributes": {
        "shelter_id": 1,
        "name": "Tom",
        "species": "chicken",
        "birthday": "2023-03-03",
        "color": "orange",
        "main_prey": "Seeds, Fruit, Insects, Berries",
        "habitat": "Open woodland and sheltered grassland",
        "diet": "Omnivore",
        "skin_type": "Feathers",
        "top_speed": "6 mph",
        "avg_litter": "2",
        "lifespan": "2 - 4 years",
        "weight": "1kg - 3kg (2.2lbs - 6.6lbs)",
        "lifestyle": "Flock",
        "fav_food": "Seeds"
    },
    "relationships": {
        "shelter": {
            "data": {
                "id": "1",
                "type": "shelter"
            }
        }
    }
})

    decorated_animal = described_class.new(animal)
    
    expect(decorated_animal.formatted_birthday).to eq('March 03, 2023')
  end
  end
end
