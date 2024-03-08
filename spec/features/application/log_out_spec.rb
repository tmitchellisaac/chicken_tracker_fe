require 'rails_helper'

RSpec.describe "Log_out Page" do
  it "has a link to go back to home ('/')" do

    user_shelters = File.read("spec/fixtures/user_shelters.json")

    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=1").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: user_shelters, headers: {})

    user = User.create!(email: "test@test.com", password:"password123", id: 1)
    visit "/users/1"
    expect(page).to have_link("Log Out")
    click_link("Log Out")

    expect(current_path).to eq(log_out_path)

    expect(page).to have_link("Back to Home")
    click_link("Back to Home")

    expect(current_path).to eq("/")
  end
end