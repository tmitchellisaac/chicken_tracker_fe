require "rails_helper"

RSpec.describe "Animal Show Page", type: :feature do
  describe "visit Animal Show Page" do
  # As a user,
  # When I visit "animal/:id"
  # I see "Animal Show"
    it "displays the page title" do
      # stub not created yet!!!
      json_response = File.read('spec/fixtures/animal_1.json')
      stub_request(:get, "http://localhost:3000/api/v1/animals/1").
      to_return(status: 200, body: json_response, headers: {})
      
      visit "/animals/1"

      expect(current_path).to eq("/animals/1")
      expect(page).to have_content("Animal Show")
    end
  end
end