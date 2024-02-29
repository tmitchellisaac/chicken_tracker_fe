require "rails_helper"

RSpec.describe "New Animal Form", type: :feature do
  
  describe "happy path" do

    it "has a form to create a new animal" do
      # WebMock.allow_net_connect!
  

      visit "/shelters/1"

      expect(current_path).to eq("/shelters/1")
      expect(page).to have_link("Create New Animal", href: "/shelters/1/animals/new")

      click_link("Create New Animal")
      
      expect(current_path).to eq("/shelters/1/animals/new")
      
      within(".new_animal_form") do
        expect(page).to have_field("name")
        expect(page).to have_field("species")
        expect(page).to have_field("birthday")
        expect(page).to have_field("color")
        expect(page).to have_button("Submit")
      end

      fill_in "name", with: "Mickey McCluckkiddy"
      select "Chicken", from: "species"
      fill_in "birthday", with: Date.new(2024,3,3)
      fill_in "color", with: "black with orange spots"

      click_button("Submit")
      # expect(current_path).to eq("/shelters/1/animals/3")
      expect(page).to have_content("Mickey McCluckkiddy")
      expect(page).to have_content("Chicken")
      expect(page).to have_content("2024-03-03")
      expect(page).to have_content("black with orange spots")
      expect(page).to have_content("Animal successfully created")
      # API attributes
      expect(page).to have_content("Seeds, Fruit, Insects, Berries")
      expect(page).to have_content("Open woodland and sheltered grassland")
      expect(page).to have_content("Omnivore")
      expect(page).to have_content("6 mph")
      expect(page).to have_content("2")
      expect(page).to have_content("2 - 4 years")
      expect(page).to have_content("1kg - 3kg (2.2lbs - 6.6lbs)")
      expect(page).to have_content("Flock")
    end
  end
end