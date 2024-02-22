require 'rails_helper'

RSpec.describe "Welcome Page" do
  it "has buttons to login or register" do
    visit "/"

    expect(page).to have_button("Log In")
    expect(page).to have_button("Register")
  end

  xit "has link to log out if current user is signed in" do
    # set current_user
    user = User.create!(email: "test@test.com", password:"password123")

    visit "/"

    expect(page).to have_link("Log Out")
    
    click_link("Log Out")

    expect(current_path).to eq("/")
    expect(page).to have_content("Logged out successfully")
    expect(session[:user_id]).to be(nil)
  end
end