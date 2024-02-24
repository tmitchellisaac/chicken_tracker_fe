require "rails_helper"

RSpec.describe "New Animal Form", type: :feature do
  
  # As a user,
  # When I visit "shelter/:id"
  # And I click the "Create New Animal" button,
  # Then I am directed to "animal/new" where I see a form to fill in the animal"s attributes:
  # I fill in "type",
  # I fill in "name",
  # I fill in "color",
  # I fill in "birthday",
  # And I see that the animal is already assigned to the shelter,
  # And when I click the "Submit" button
  # Then I am taken to the animal show page where I see the new animal and all of its attributes.
  # And I see the message "Animal successfully created."
  describe "happy path" do

    it "has a form to create a new animal" do
      json_response = File.read('spec/fixtures/shelter_1.json')
      stub_request(:get, "http://localhost:3000/api/v1/shelters/1").
      to_return(status: 200, body: json_response, headers: {})
      
      visit "/shelters/1"

      expect(current_path).to eq("/shelters/1")
      expect(page).to have_link("Create New Animal", href: "/shelters/1/animals/new")
      
      click_link("Create New Animal")
      
      expect(current_path).to eq("/shelters/1/animals/new")
      
      within(".new_animal_form") do
        expect(page).to have_field("name")
        expect(page).to have_field("species_id")
        expect(page).to have_field("birthday")
        expect(page).to have_field("color")
        expect(page).to have_button("Submit")
      end

      fill_in "name", with: "Mickey McCluckkiddy"
      select "Chicken", from: "species_id"
      fill_in "birthday", with: Date.new(2024,3,3)
      fill_in "color", with: "black with orange spots"

      click_button("Submit")
# the path need to be fixed/confirmed when a fixture is made for it
      expect(current_path).to eq("/shelters/1/animals/1")
# the logic for the view needs to be added 
      # user-defined attributes
      expect(page).to have_content("Animal successfully created.")
      expect(page).to have_content("Mickey McCluckkiddy")
      expect(page).to have_content("Chicken")
      expect(page).to have_content("03/03/2020")
      expect(page).to have_content("black with orange spots")
      # API attributes
      expect(page).to have_content(animal.main_prey)
      expect(page).to have_content(animal.habitat)
      expect(page).to have_content(animal.diet)
      expect(page).to have_content(animal.top_speed)
      expect(page).to have_content(animal.average_clutch_size)
      expect(page).to have_content(animal.lifespan)
      expect(page).to have_content(animal.avg_weight)
      expect(page).to have_content(animal.lifestyle)
    end
  end
end