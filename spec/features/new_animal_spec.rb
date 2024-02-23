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
    # let(:shelter) { Shelter.new(name: ) }

    it "has a form to create a new animal" do
      json_response = File.read('spec/fixtures/shelter_1.json')
      stub_request(:get, "http://localhost:3000/api/v1/shelters/1").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: json_response, headers: {})
      
      visit "/shelters/1"
      # visit shelter_path(shelter)
      expect(current_path).to eq("/shelters/1")
      expect(page).to have_link("Create New Animal", href: "/shelters/1/animals/new")
      
      click_link("Create New Animal")
      save_and_open_page
      
      expect(current_path).to eq("/shelters/1/animals/new")
      
      within(new_animal_form) do
        expect(page).to have_field("Type")
        expect(page).to have_field("Name")
        expect(page).to have_field("Color")
        expect(page).to have_field("Birthday")
        expect(page).to have_button("Submit")
      end

      fill_in "Type", with: "chicken"
      fill_in "Name", with: "Mickey McCluckkiddy"
      fill_in "Color", with: "black with orange spots"
      fill_in "Date", with: Date.new(2024,3,3)

      click_button("Submit")

      expect(current_path).to eq(shelter_animal(animal))
      
      # user-defined attributes
      expect(page).to have_content("Animal successfully created.")
      expect(page).to have_content("chicken")
      expect(page).to have_content("Mickey McCluckkiddy")
      expect(page).to have_content("black with orange spots")
      expect(page).to have_content("10/3/2020")
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