require 'rails_helper'

RSpec.describe "Logging In" do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "test")
    visit log_in_path
  end

  it "has a log in form" do
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button("Log In")
  end

  it "can log in with valid credentials" do
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on "Log In"

    expect(current_path).to eq("/users/#{@user.id}")
  end

  it "cannot log in with bad credentials" do
    fill_in :email, with: @user.email
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"

    expect(current_path).to eq(log_in_path)
    expect(page).to have_content("Unable to log in. Please try again")
  end
end