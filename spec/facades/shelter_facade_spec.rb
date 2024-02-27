require "rails_helper"

RSpec.describe ShelterFacade do

  describe "#initialize" do
    it "exists" do
      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"})

      expect(shelter_facade).to be_a(ShelterFacade)
      expect(shelter_facade.name).to eq("red barn")
      expect(shelter_facade.user_id).to eq("1")
      expect(shelter_facade.shelter_service).to be_a(ShelterService)
    end
  end

  describe "#shelter" do
    it "returns a shelter", :vcr do
      shelter_facade = ShelterFacade.new({"shelter": {"name": "Red Barn", "user_id": "1"}})
      shelter = shelter_facade.shelter

      expect(shelter).to_not be(nil)
      expect(shelter.name).to eq("red barn")
      expect(shelter.user_id).to eq("1")
    end

    it "converts shelters to poros", :vcr do
      shelter_facade = ShelterFacade.new({"name": "red barn", "user_id": "1"})
      shelter = shelter_facade.shelter

      expect(shelter).to be_a(Shelter)
      expect(shelter.id).to eq("1")
      expect(shelter.name).to eq("red barn")
    end
  end

  xdescribe "#create_shelter" do
    it "can send a post request " do


      expect(status_code).to eq(200)
    end
  end
end