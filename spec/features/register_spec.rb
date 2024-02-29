require 'rails_helper'

RSpec.describe "New User Registration" do

  before(:each) do
    visit(new_user_path)
  end

  it "has a form to register a new user" do
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_field(:password_confirmation)
    expect(page).to have_button("Submit")
  end

  describe "[happy path]" do
    it "can register a new user" do
      fill_in :email, with: "test@test.com"
      fill_in :password, with: "test"
      fill_in :password_confirmation, with: "test"

      click_on "Submit"

      user = User.last

      expect(current_path).to eq("/users/#{user.id}")
    end
  end

  describe "[sad path]" do
    it "cannot register a new user if email is taken" do
      user = User.create(email: "test@test.com", password: "test")

      fill_in :email, with: "test@test.com"
      fill_in :password, with: "test"
      fill_in :password_confirmation, with: "test"

      click_on "Submit"

      expect(current_path).to eq("/users/new")
      expect(page).to have_content("Unable to create user. Please try again.")
    end

    it "cannot register a new user if password and password confirmation do not match" do
      fill_in :email, with: "test@test.com"
      fill_in :password, with: "test"
      fill_in :password_confirmation, with: "something else"

      click_on "Submit"

      expect(current_path).to eq("/users/new")
      expect(page).to have_content("User not created. Please ensure password and password confirmation match.")
    end
  end
end