require "rails_helper"

RSpec.describe "Edit an Animal", type: :feature do
  xit "can edit an animals info" do

    json_response = File.read("spec/fixtures/animals_show.json")
    stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/1").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: json_response, headers: {})
    # As a user
    # When I visit my animal's show page
    # I see a link to edit that animal
    # I click the link and am taken to a form "/shelters/shelter_id/animals/animal_id/edit"
    # I fill in the form with updated information and click submit
    # I am then taken back to the animals show page and I see the updated information there.
    visit "/shelters/1/animals/1"
save_and_open_page
    expect(page).to have_content("edit this animal")
    click "edit this animal"
    expect(current_path).to eq("/shelters/1/animals/1/edit")

    fill_in "name", with: "Henry"

    click "update info"
    expect(current_path).to eq("/shelters/1/animals/1")
    expect(page).to have_content("Henry")
  end



end