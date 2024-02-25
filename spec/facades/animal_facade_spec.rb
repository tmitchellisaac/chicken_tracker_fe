require "rails_helper"

RSpec.describe AnimalFacade do

  xit "can call the facade and retrieve an animal" do
    # the fixture file has not been made yet (spec/fixtures/animal_1.json)
    json_response = File.read('spec/fixtures/animal_1.json')
    stub_request(:get, "http://localhost:3000/api/v1/animals/1").
    to_return(status: 200, body: json_response, headers: {})
    
    facade = AnimalFacade.new(id: 1)
    animal = facade.animal
    
    expect(animal).to be_a(Animal)
    expect(animal.id).to eq(animal[:data][:id])
    expect(animal.name).to eq(animal[:attributes][:name])
    expect(animal.species).to eq(animal[:attributes][:species])
    expect(animal.birthday).to eq(animal[:attributes][:birthday])
    expect(animal.color).to eq(animal[:attributes][:color])
    expect(animal.main_prey).to eq(animal[:attributes][:main_prey])
    expect(animal.habitat).to eq(animal[:attributes][:habitat])
    expect(animal.diet).to eq(animal[:attributes][:diet])
    expect(animal.top_speed).to eq(animal[:attributes][:top_speed])
    expect(animal.average_clutch_size).to eq(animal[:attributes][:average_clutch_size])
    expect(animal.lifespan).to eq(animal[:attributes][:lifespan])
    expect(animal.avg_weight).to eq(animal[:attributes][:avg_weight])
    expect(animal.lifestyle).to eq(animal[:attributes][:lifestyle])
  end
end
