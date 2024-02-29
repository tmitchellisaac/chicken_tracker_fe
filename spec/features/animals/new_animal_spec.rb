require "rails_helper"

RSpec.describe "New Animal Form", type: :feature do
  
  describe "happy path" do
    it "has a form to create a new animal" do
      WebMock.allow_net_connect!
      # shelter_show_json_response = File.read("spec/fixtures/shelter_1.json")
      # stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
      # with(
      #   headers: {
      #  'Accept'=>'*/*',
      #  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #  'User-Agent'=>'Faraday v2.9.0'
      #   }).
      # to_return(status: 200, body: shelter_show_json_response, headers: {})

      # create_animal_response = File.read("spec/fixtures/create_animal_response.json")
      # stub_request(:post, "http://localhost:5000/api/v1/shelters/1/animals").
      #    with(
      #      body: "{\"animal\":{\"shelter_id\":1,\"name\":\"Mickey McCluckkiddy\",\"species\":\"Chicken\",\"color\":\"black with orange spots\",\"birthday\":\"2024-03-03\"}}",
      #      headers: {
      #     'Accept'=>'*/*',
      #     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #     'User-Agent'=>'Faraday v2.9.0'
      #      }).
        
      #    to_return(status: 200, body: create_animal_response, headers: {})

      # get_animal_response = File.read("spec/fixtures/animals_show_response.json")
      # stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/3").
      #   with(
      #     headers: {
      #       'Accept'=>'*/*',
      #        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #        'User-Agent'=>'Faraday v2.9.0'
      #  }).
      # to_return(status: 200, body: get_animal_response, headers: {})

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
        expect(page).to have_button("Save")
      end

      fill_in "name", with: "Mickey McCluckkiddy"
      select "Chicken", from: "species"
      fill_in "birthday", with: Date.new(2024,3,3)
      fill_in "color", with: "black with orange spots"

      click_button("Save")
      # expect(current_path).to eq("/shelters/1/animals/3")
      expect(page).to have_content("Animal successfully created")
      expect(page).to have_content("Mickey McCluckkiddy")
      expect(page).to have_content("Type: Chicken")
      expect(page).to have_content("Birthday: March 03, 2024")
      expect(page).to have_content("Color: black with orange spots")
      # API attributes
      expect(page).to have_content("Main Food Source: Seeds, Fruit, Insects, Berries")
      expect(page).to have_content("Favorite Food: Seeds")
      expect(page).to have_content("Habitat: Open woodland and sheltered grassland")
      expect(page).to have_content("Diet Type: Omnivore")
      expect(page).to have_content("Top Speed: 6 mph")
      expect(page).to have_content("Avg Litter Size: 2")
      expect(page).to have_content("Avg Lifespan: 2 - 4 years")
      expect(page).to have_content("Weight: 1kg - 3kg (2.2lbs - 6.6lbs)")
      expect(page).to have_content("Lifestyle: Flock")
    end
  end
end