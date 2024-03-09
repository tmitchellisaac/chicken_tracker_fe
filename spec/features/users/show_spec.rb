require 'rails_helper'

RSpec.describe "User Dashboard (users/show page)" do
  before(:each) do
    shelters_index  = File.read("spec/fixtures/shelters_index.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=1").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: shelters_index, headers: {})
  end
  
  it "visits the user's dashboard" do
    user = User.create!(email: "test@test.com", password:"password123", id: 1)

    visit "/users/1"
    
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("User Dashboard")
    expect(page).to have_content("User Email:")
    expect(page).to have_content("My Shelters")
  end
  
  it "has a link to log out" do
    user = User.create!(email: "test@test.com", password:"password123", id: 1)
    
    visit "/users/1"

    expect(page).to have_link("Log Out")

    click_link("Log Out")

    expect(current_path).to eq(log_out_path)
  end
end