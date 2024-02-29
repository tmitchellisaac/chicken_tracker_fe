require 'rails_helper'

RSpec.describe "Log_out Page" do
  it "has a link to go back to home ('/')" do
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