require 'rails_helper'

RSpec.describe "User Show Page" do
  before(:each) do
    @user = User.create!(email: "test@test.com", password: "test")

    visit "/users/#{@user.id}"
  end

  it "displays user attributes" do
    expect(page).to have_content("Email: #{@user.email}")
  end

  it "displays a count of total animals belonging to that user" do
    # webmock api call to get animals and store as poros

    expect(page).to have_content("Total Animals: #{@user.count_animals}")
    
  end
end