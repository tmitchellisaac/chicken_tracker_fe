require "rails_helper"

RSpec.describe AnimalFacade do

  it "should call the facade and retrieve search results" do
    # the fixture file has not been made yet
    json_response = File.read('spec/fixtures/animal_1.json')
    stub_request(:get, "http://localhost:3000/api/v1/animals/1").
    to_return(status: 200, body: json_response, headers: {})
    
    facade = AnimalFacade.new(id: 1)
    animal = facade.animal
    
    expect(animal).to be_a(Animal)
    expect(animal.id).to eq("1")
    expect(animal.name).to eq("red barn")
  end
end