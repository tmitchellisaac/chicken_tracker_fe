require "rails_helper"


RSpec.describe "Shelter index", type: :feature do
  before(:each) do
  @user = User.create!(id: "1", email: "test@test.com", password: "test")

    # visit "/users/1"
  end

  it " displays the shelter associated with a user" do

    shelters_index = File.read("spec/fixtures/shelters_index.json")
    
    stub_request(:get, "http://localhost:3000/api/v1/shelters?user_id=1").
      with(
        headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: shelters_index, headers: {})
    
    visit "/users/1"
    expect(page).to have_content(@user.email)

    expect(page).to have_content("brown barn")
    expect(page).to have_content("blue coop")
  end
end

