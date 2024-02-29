require "rails_helper"


RSpec.describe "Shelter index", type: :feature do
  before(:each) do
  @user = User.create!(id: "1", email: "test@test.com", password: "test")
  end

  xit " displays the shelter associated with a user" do
  
    visit "/users/1"

    expect(page).to have_content(@user.email)

    expect(page).to have_content("brown barn")
    expect(page).to have_content("blue coop")
  end
end

