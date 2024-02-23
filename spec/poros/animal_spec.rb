require "spec_helper"

RSpec.describe Animal do
  it "exists" do
    attributes = { name: "McClucky", species: "Chicken", birthday: "3/3/2024", color: "brown" }
    animal = Animal.new
    expect(animal).to be_a(Animal)
  end
end