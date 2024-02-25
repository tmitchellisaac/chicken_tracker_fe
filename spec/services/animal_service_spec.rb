require "rails_helper"

RSpec.describe "Animal Service", type: :service do
  describe "Animal service" do
    it "calls a animal" do
      # @animal = Animal.new(name: "McClucky Cluckin'")

      expect(animal).to have_key(:name)
      expect(animal[:name]).to be_a(String)
      expect(animal[:name]).to eq("McCluckey Cluckin'")
    end
  end
end