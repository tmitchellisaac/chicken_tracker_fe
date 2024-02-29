require 'rails_helper'

RSpec.describe "Welcome Page" do
  it "has links to login" do
    visit "/"

    expect(page).to have_button("Log In with Email")
    click_button("Log In with Email")

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

    # log in to set current_user
    user = User.create(email: "test@test.com", password: "password123", password_confirmation: "password123")
    
    visit "/log_in"
    
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Submit"

    visit "/"

    expect(page).to have_link("Log Out")
    
    click_on("Log Out")

    expect(page).to have_content("Logged out successfully")
    expect(current_path).to eq("/log_out")
  end

  it "has a link to the user dashboard (user show page)" do
    user = User.create(email: "test@test.com", password: "password123", password_confirmation: "password123")
    
    visit "/log_in"
    
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Submit"

    visit "/"

    expect(page).to have_link("User Dashboard")

    click_on("User Dashboard")

    expect(current_path).to eq("/users/#{user.id}")
  end
end