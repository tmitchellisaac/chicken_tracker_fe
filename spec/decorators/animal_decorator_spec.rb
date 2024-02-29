require 'rails_helper'

RSpec.describe AnimalDecorator do
  describe '#formatted_birthday' do
    it 'formats the birthday attribute' do

    animal = Animal.new({
      "id": "1",
      "type": "animal",
      "attributes": {
          "shelter_id": 1,
          "name": "Tom",
          "species": "chicken",
          "birthday": "2023-03-03",
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