require "rails_helper"

RSpec.describe AnimalFacade do

  it "should call the facade and retrieve search results" do
    # the fixture file has not been made yet
    json_response = File.read('spec/fixtures/animals_show.json')
    stub_request(:get, "http://localhost:5000/api/v1/animals/1").
    to_return(status: 200, body: json_response, headers: {})
    
    facade = AnimalFacade.new(id: 1)
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
end
