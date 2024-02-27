require 'rails_helper'

RSpec.describe "User Dashboard (users/show page)" do
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