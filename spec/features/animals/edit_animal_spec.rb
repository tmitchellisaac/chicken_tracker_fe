require "rails_helper"

RSpec.describe "Edit an Animal", type: :feature do
  it "has a link to an edit an animal form" do
    json_response = File.read("spec/fixtures/animals_show.json")

    stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/1").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: json_response, headers: {})

    visit "/shelters/1/animals/1"
    expect(page).to have_content("Tom")
    expect(page).to have_content("orange")

    click_button "Edit this animal"

    expect(current_path).to eq("/shelters/1/animals/1/edit")
  end


  it "can edit an animals info" do
  # WebMock.allow_net_connect!
    # json_response = File.read("spec/fixtures/animals_show.json")
    updated_response = File.read("spec/fixtures/animal_update.json")
    

    stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/1").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: updated_response, headers: {})

    stub_request(:patch, "http://localhost:5000/api/v1/shelters/1/animals/1").
    with(
      body: "{\"animal\":{\"shelter_id\":1,\"name\":\"Henry\",\"species\":\"Chicken\",\"color\":\"black and grey\",\"birthday\":\"2023-03-03\"}}",
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'Content-Type'=>'application/json',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: updated_response, headers: {})
    # As a user
    # When I visit my animal's show page
    # I see a link to edit that animal
    # I click the link and am taken to a form "/shelters/shelter_id/animals/animal_id/edit"
    # I fill in the form with updated information and click submit
    # I am then taken back to the animals show page and I see the updated information there.
    visit "/shelters/1/animals/1"
    click_button "Edit this animal"

    expect(current_path).to eq("/shelters/1/animals/1/edit")
    fill_in "name", with: "Henry"
    fill_in "color", with: "black and grey"
    click_button "Confirm Edit"
    expect(current_path).to eq("/shelters/1/animals/1")
    expect(page).to have_content("Henry")
    expect(page).to have_content("black and grey")
  end
end