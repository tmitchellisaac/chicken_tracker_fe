require "rails_helper"

RSpec.describe "Shelter Show Page", type: :feature do
  describe "visit Shelter Show Page" do
  # As a user,
  # When I visit "shelter/:id"
  # I see "Shelter Show"
    it "displays the page title" do
      
      visit "/shelters/1"

      expect(current_path).to eq("/shelters/1")
      expect(page).to have_content("Shelter Show")
    end
  end
end