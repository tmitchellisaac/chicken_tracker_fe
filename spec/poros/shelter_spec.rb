require "spec_helper"
require_relative "../../app/poros/shelter"

RSpec.describe Shelter do
  it "exists" do
    attr = { id: 1, attributes: { name: "McClucky's Coupe Coop: A Chic Chicken Coup Shelter" } }
    shelter = Shelter.new(attr)

    expect(shelter).to be_a(Shelter)
    expect(shelter.id).to eq(attr[:id])
    expect(shelter.name).to eq(attr[:attributes][:name])
  end
end