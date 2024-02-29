require "rails_helper"

RSpec.describe "Animal Service", type: :service do
  describe "Animal service" do
    xit "calls a animal" do


      service = AnimalService.new
      poro_data = service.get_animal(1,1)[:data]
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