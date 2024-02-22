require "spec_helper"

RSpec.describe Shelter do
  it "exists" do
    attributes = { name: "McClucky's Coupe Coop: A Chic Chicken Coup Shelter"}
    shelter = Shelter.new
    expect(shelter).to be_a(Shelter)
  end
end