require "rails_helper"

RSpec.describe "Animal Service", type: :service do
  describe "Animal Service" do
    it "calls a animal" do
      json_response = File.read("spec/fixtures/animals_show.json")
      stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/1").
        to_return(status: 200, body: json_response, headers: {})
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals/1").
        to_return(status: 200, body: json_response, headers: {})

      service = AnimalService.new
      poro_data = service.get_animal_service(1,1)#[:data]
      expect(poro_data[:id]).to eq("1") 
      expect(poro_data[:type]).to eq("animal") 
      expect(poro_data[:attributes][:name]).to eq("Tom") 
      expect(poro_data[:attributes][:species]).to eq("chicken") 
      expect(poro_data[:attributes][:birthday]).to eq("2023-03-03") 
      expect(poro_data[:attributes][:color]).to eq("orange") 
      expect(poro_data[:attributes][:main_prey]).to eq("Seeds, Fruit, Insects, Berries") 
      expect(poro_data[:attributes][:habitat]).to eq("Open woodland and sheltered grassland") 
      expect(poro_data[:attributes][:diet]).to eq("Omnivore") 
      expect(poro_data[:attributes][:skin_type]).to eq("Feathers") 
      expect(poro_data[:attributes][:top_speed]).to eq("6 mph") 
      expect(poro_data[:attributes][:name]).to eq("Tom") 
      expect(poro_data[:attributes][:name]).to eq("Tom")
      expect(poro_data[:attributes][:shelter_id]).to eq(1)

    end
  end
end