require "rails_helper"

RSpec.describe "Shelter Service", type: :service do
  describe "shelter service" do
    it "calls a shelter (shelter show)" do

      raw_data = ShelterService.new.get_shelter(1)
      poro_ready_data = raw_data[:data]

      expect(raw_data).to have_key(:data)
      expect(poro_ready_data).to have_key(:id)
      expect(poro_ready_data[:id]).to eq("1")
      expect(poro_ready_data[:type]).to eq("shelter")
      expect(poro_ready_data[:attributes]).to be_a(Hash)
      expect(poro_ready_data[:attributes][:name]).to eq("red barn")
    end

    it "calls all of user's shelters (shelter index)" do
      @user = User.create!(email: "test@test.com", password: "test", id: 1)

      poro_ready_data = ShelterService.new.get_shelters(1)

      expect(poro_ready_data.first).to have_key(:id)

      expect(poro_ready_data.first[:id]).to eq("1")
      expect(poro_ready_data.first[:type]).to eq("shelter")
      expect(poro_ready_data.first[:attributes]).to be_a(Hash)
      expect(poro_ready_data.first[:attributes][:name]).to eq("brown barn")
      expect(poro_ready_data.first[:attributes][:user_id]).to eq(1)
      expect(poro_ready_data.first[:relationships]).to be_a(Hash)
      expect(poro_ready_data.first[:relationships][:animals]).to be_a(Hash)

      expect(poro_ready_data.second[:id]).to eq("2")
      expect(poro_ready_data.second[:type]).to eq("shelter")
      expect(poro_ready_data.second[:attributes]).to be_a(Hash)
      expect(poro_ready_data.second[:attributes][:name]).to eq("blue coop")
      expect(poro_ready_data.second[:attributes][:user_id]).to eq(1)
      expect(poro_ready_data.second[:relationships]).to be_a(Hash)
      expect(poro_ready_data.second[:relationships][:animals]).to be_a(Hash)
    end
  end
end