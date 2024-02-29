require "rails_helper"

RSpec.describe "Animal Show Page", type: :feature do
  describe "visit Animal Show Page" do
  # As a user,
  # When I visit "animal/:id"
  # I see "Animal Show"
    it "displays the page title" do
      # stub not created yet!!!
      # WebMock.allow_net_connect!
      json_response = File.read('spec/fixtures/animals_show.json')
  
      animal = Animal.new(JSON.parse(json_response, symbolize_names: true)[:data])


      # visit "/shelters/1/animals/1"
      
      visit "/shelters/#{animal.shelter_id}/animals/#{animal.id}"
      expect(current_path).to eq("/shelters/#{animal.shelter_id}/animals/#{animal.id}")
      expect(page).to have_content("Animal Show Page")
    end
  end
end