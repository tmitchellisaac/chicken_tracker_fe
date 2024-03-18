require "rails_helper"

RSpec.describe "Shelter Show Page", type: :feature do
  before do
    json_response = File.read('spec/fixtures/shelter_1.json')
    stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
    to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      shelters_animals = File.read("spec/fixtures/animals_index.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body:  shelters_animals, headers: {})

    visit "/shelters/1"
  end
  describe "visit Shelter Show Page" do
  # As a user,
  # When I visit "shelter/:id"
  # I see "Shelter Show"
    it "displays the page title" do
      expect(current_path).to eq("/shelters/1")
      expect(page).to have_content("Tom")
      expect(page).to have_content("Bubba")
      expect(page).to have_content("Helena")
      expect(page).to have_content("Create New Animal")
      expect(page).to have_content("Edit Shelter")

    end
  end

  it "displays the number of animals per a shelter" do
    expect(page).to have_content("5 animals currently living in \"red barn\":")

    shelters_animals = File.read("spec/fixtures/animal_index.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body:  shelters_animals, headers: {})

    visit "/shelters/1"
    expect(page).to have_content("1 animal currently living in \"red barn\"")
  end
end
