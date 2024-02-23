require "rails_helper"

RSpec.describe "Shelter Service", type: :feature do
  describe "shelter service" do
    it "calls a shelter" do
      # @shelter = Shelter.new(name: "red barn")

      expect(shelter).to have_key(:name)
      expect(shelter[:name]).to be_a(String)
      expect(shelter[:name]).to eq("red barn")
    end
  end
end