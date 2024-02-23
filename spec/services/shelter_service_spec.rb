require "rails_helper"

RSpec.describe "Shelter Service", type: :feature do
  it "calls a shelter" do
    visit "/shelters/1"
# require "pry"; binding.pry
    expect(shelter).to have_key(:name)
    expect(shelter[:name]).to be_a(String)
    expect(shelter[:name]).to eq("red barn")
  end
end