require "rails_helper"

RSpec.describe AnimalFacade do

  it "exists" do
    animal_facade = AnimalFacade.new(id: 1)

    expect(animal_facade).to be_a(AnimalFacade)
    # expect(animal_facade.params).to eq(?) # idk how to test this exactly
    expect(animal_facade.animal_service).to be_a(AnimalService)
  end

  it "should " do
    
    facade = AnimalFacade.new(id: 1, shelter_id: 1)
    animal = facade.animal
    expect(animal).to be_a(Animal)
    expect(animal.id).to eq("1")
    expect(animal.name).to eq("Tom")
    expect(animal.species).to eq("chicken")
    expect(animal.birthday).to eq("2023-03-03")
    expect(animal.color).to eq("orange")
    expect(animal.main_prey).to eq("Seeds, Fruit, Insects, Berries")
    expect(animal.habitat).to eq("Open woodland and sheltered grassland")
    expect(animal.diet).to eq("Omnivore")
    expect(animal.top_speed).to eq("6 mph")
    expect(animal.avg_litter).to eq("2")
    expect(animal.lifespan).to eq("2 - 4 years")
    expect(animal.weight).to eq("1kg - 3kg (2.2lbs - 6.6lbs)")
    expect(animal.lifestyle).to eq("Flock")
    expect(animal.shelter_id).to eq("1")
  end

  describe "#shelter_id" do
    it "should return the shelter ID from params" do
      facade = AnimalFacade.new(id: "1", shelter_id: "42")
      expect(facade.shelter_id).to eq("42")
    end
  end

  xdescribe "#animal" do
    it "creates a new animal poros by calling the service?" do

    end 
  end

  xdescribe "#create_animal" do
    it "?" do
    end 
  end
end
