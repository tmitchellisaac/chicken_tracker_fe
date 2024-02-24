require "rails_helper"

RSpec.describe ShelterFacade do

  it "should call the facade and retrieve search results" do
    json_response = File.read('spec/fixtures/shelter_1.json')
    stub_request(:get, "http://localhost:3000/api/v1/shelters/1").
    to_return(status: 200, body: json_response, headers: {})
    
    facade = ShelterFacade.new(id: 1)
    shelter = facade.shelter
    
    expect(shelter).to be_a(Shelter)
    expect(shelter.id).to eq("1")
    expect(shelter.name).to eq("red barn")
  end
end