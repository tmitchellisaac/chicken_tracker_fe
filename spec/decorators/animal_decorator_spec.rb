require 'rails_helper'

RSpec.describe AnimalDecorator do
  describe '#formatted_birthday' do
    it 'formats the birthday attribute' do

      animal = instance_double("Animal", birthday: Date.new(2023, 3, 3))
      decorated_animal = AnimalDecorator.new(animal)

      expect(decorated_animal.formatted_birthday).to eq('March 03, 2023')
      end
    end
  end

  describe "#animal_image" do
    describe "[happy path]" do
      it "returns an image tag for a chicken" do
        animal = instance_double("Animal", species: "Chicken")
        decorated_animal = AnimalDecorator.new(animal)

        expect(decorated_animal.animal_image).to eq(ActionController::Base.helpers.image_tag("chicken.jpeg", alt: "Chicken", size: "50x50"))
      end

      it "returns an image tag for a bee" do
        animal = instance_double("Animal", species: "Bee")
        decorated_animal = AnimalDecorator.new(animal)

        expect(decorated_animal.animal_image).to eq(ActionController::Base.helpers.image_tag("bee.jpeg", alt: "Bee", size: "50x50"))
      end
    end

    describe "[sad path]" do
      it "returns nil if species is not chicken" do
        animal = instance_double("Animal", species: "Not Chicken")
        decorated_animal = AnimalDecorator.new(animal)

        expect(decorated_animal.animal_image).to be_nil
      end

      it "returns nil if species is not bee" do
        animal = instance_double("Animal", species: "Not Bee")
        decorated_animal = AnimalDecorator.new(animal)

        expect(decorated_animal.animal_image).to be_nil
      end
    end
end