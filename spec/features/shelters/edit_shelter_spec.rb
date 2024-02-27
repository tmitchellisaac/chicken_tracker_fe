require "rails_helper"

RSpec.describe "Edit a Shelter" do

  before(:each) do
    @user_1 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")
    @user_2 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")
  end

  xit "has a form to edit shelter attributes", :vcr do
    visit "/shelters/1/edit"

    expect(page).to have_content("Edit Shelter")
    expect(page).to have_content("Name:")
    expect(page).to have_content("User_ID:")
    expect(page).to have_button("Save")
  end

  xit "pre-populates form with shelter attributes", :vcr do
    visit "/shelters/1/edit"
    
    expect(page).to have_content("Name:") # idk how to test this
    expect(page).to have_content("User_ID:") # idk how to test this
  end

  xit "can update a shelter when the form is saved", :vcr do
    visit "/shelters/1/edit"

    fill_in :name, with: "purple barn"
    fill_in :user_id, with: "2"
    click_on "Save"

    expect(page).to have_content("Name: purple barn")
    expect(page).to have_content("User ID: 2")
  end
end