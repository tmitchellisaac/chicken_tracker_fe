require "rails_helper"


RSpec.describe "Shelter index", type: :feature do

  # Simulate a user logging in to fix the navbar issue
  before :each do
    @user = User.create!(email: "test@test.com", password: "test", password_confirmation: "test", id: 1)
    user_shelters = File.read("spec/fixtures/user_shelters.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=1").
      to_return(status: 200, body: user_shelters, headers: {})
    visit log_in_path
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: @user.password
    click_on "Sign In"
  end

  it " displays the shelter associated with a user" do

    shelters_index = File.read("spec/fixtures/shelters_index.json")
    
    stub_request(:get, "http://localhost:5000/api/v1/shelters?user_id=1").
      to_return(status: 200, body: shelters_index, headers: {})
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=1").
      to_return(status: 200, body: shelters_index, headers: {})
    
    visit "/users/1"
    click_link "All Shelters"
    expect(page).to have_content("brown barn")
    expect(page).to have_content("blue coop")
  end
end

