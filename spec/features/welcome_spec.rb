require 'rails_helper'

RSpec.describe "Welcome Page" do
  it "has links to login" do
    visit "/"

    expect(page).to have_button("Log In")

    click_button("Log In")

    expect(current_path).to eq(log_in_path)
  end

  it "has links to register" do
    visit "/"

    expect(page).to have_button("Register")

    click_button("Register")

    expect(current_path).to eq(new_user_path)
  end

  it "has link to log out if current user is signed in" do
    user = User.create!(email: "test@test.com", password:"password123", id: 87)
    
    json_response = File.read("spec/fixtures/shelters_index.json")
    stub_request(:get, "http://localhost:5000/api/v1/shelters?user_id=87").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: json_response, headers: {})

    # log in to set current_user
    user = User.create!(email: "test@test.com", password: "password123", password_confirmation: "password123")
    
    visit "/log_in"
    
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"

    visit "/"

    expect(page).to have_link("Log Out")
    
    click_on("Log Out")

    expect(current_path).to eq("/log_out")
    expect(page).to have_content("Logged out successfully")
  end
end