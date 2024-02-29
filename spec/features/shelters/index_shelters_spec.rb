require "rails_helper"

RSpec.describe "Shelter index", type: :feature do
  before(:each) do
    @user = User.create!(id: "1", email: "test@test.com", password: "test")
  end

  xit " displays the shelter associated with a user" do
    shelters_index_json_response = File.read("spec/fixtures/shelters_index.json")
    stub_request(:get, "http://localhost:5000/api/v1/shelters?user_id=1").
      with(
        headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: shelters_index_json_response, headers: {})
    
    visit "/users/1"
    expect(page).to have_content(@user.email)

    expect(page).to have_content("brown barn")
    expect(page).to have_content("blue coop")
  end
end