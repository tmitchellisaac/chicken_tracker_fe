require 'rails_helper'

RSpec.describe "Registering a new user" do
  before(:each) do
    visit "/users/new"
  end

  it "displays a form to create a new user" do
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_button("Submit")
  end

  it "can create a new user" do
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "test"
    fill_in :password_confirmation, with: "test"
    click_on "Submit" # clicking Submit seems to make a request, but its not stubbed, so its erroring here. I can't tell which request its trying to call so not sure what to stub exactly.

    # binding.pry
    # why isn't the user being created? (run User.last in pry)

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it "cannot create a user if password_confirmation does not match password" do
    fill_in :email, with: "test@test.com"
    fill_in :password, with: "test"
    fill_in :password_confirmation, with: "something else"
  
    click_on "Submit"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("User not created. Please ensure password and password confirmation match.")
  end

  it "has a link to Log In" do
    expect(page).to have_button("Log In with Email")

    click_button("Log In with Email")

    expect(current_path).to eq(log_in_path)
  end
end