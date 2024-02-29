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
            "birthday": "2023-03-03"
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

  describe "#chicken_image" do
    # it "displays a chicken if species is chicken" do

    # end
    it "returns an image tag for a chicken" do
      animal = instance_double("Animal", species: "Chicken")
      decorated_animal = AnimalDecorator.new(animal)

      expect(decorated_animal.chicken_image).to eq(ActionController::Base.helpers.image_tag("chicken.jpeg", alt: "Chicken", size: "50x50"))
    end

    it "returns nil if species is not chicken" do
      animal = instance_double("Animal", species: "Not Chicken")
      decorated_animal = AnimalDecorator.new(animal)

      expect(decorated_animal.chicken_image).to be_nil
    end
  end

  describe "#bee_image" do
    it "returns an image tag for a bee" do
      animal = instance_double("Animal", species: "Bee")
      decorated_animal = AnimalDecorator.new(animal)

      expect(decorated_animal.bee_image).to eq(ActionController::Base.helpers.image_tag("bee.jpeg", alt: "Bee", size: "50x50"))
    end

    it "returns nil if species is not bee" do
      animal = instance_double("Animal", species: "Not Bee")
      decorated_animal = AnimalDecorator.new(animal)

      expect(decorated_animal.bee_image).to be_nil
    end
  end
end