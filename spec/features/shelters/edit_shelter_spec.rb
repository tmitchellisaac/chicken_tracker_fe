require "rails_helper"

RSpec.describe "Edit a Shelter" do

  before(:each) do
    @user_1 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")
    @user_2 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")

    visit "/shelters/edit"
  end

  it "has a form to edit shelter attributes" do
    expect(page).to have_content("Name:")
    expect(page).to have_content("User_ID:")
  end

  it "can update a shelter when the form is saved" do
    visit "/shelters/edit"

    fill_in :name, with: "purple barn"
    fill_in :user_id, with: "2"
    click_on "Save"

    expect(page).to have_content("Name:")
    expect(page).to have_content("User_ID:")
  end
end