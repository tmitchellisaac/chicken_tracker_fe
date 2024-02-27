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
      # stub_request(:get, "http://localhost:3000/api/v1/animals/1").
      # to_return(status: 200, body: json_response, headers: {})
      animal = Animal.new(JSON.parse(json_response, symbolize_names: true)[:data])

      stub_request(:get, "http://localhost:5000/api/v1/shelters/#{animal.shelter_id}/animals/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

      # visit "/shelters/1/animals/1"
      
      visit "/shelters/#{animal.shelter_id}/animals/#{animal.id}"
      expect(current_path).to eq("/shelters/#{animal.shelter_id}/animals/#{animal.id}")
      expect(page).to have_content("Animal Show Page")
    end
  end
end