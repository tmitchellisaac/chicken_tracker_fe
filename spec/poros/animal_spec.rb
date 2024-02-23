require "spec_helper"
require_relative "../../app/poros/animal" # <-- I don't know why this is needed

RSpec.describe Animal do
  it "exists" do
    attr = { id: 1, attributes: { name: "McClucky", species: "Chicken", birthday: "3/3/2024", color: "brown" } }
    animal = Animal.new(attr)

    expect(animal).to be_a(Animal)
    expect(animal.id).to eq(attr[:id])
    expect(animal.name).to eq(attr[:attributes][:name])
    expect(animal.species).to eq(attr[:attributes][:species])
    expect(animal.birthday).to eq(attr[:attributes][:birthday])
    expect(animal.color).to eq(attr[:attributes][:color])
  end
end