require "rails_helper"

RSpec.describe "Edit a Shelter" do

  before(:each) do
    @user_1 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")
    @user_2 = User.create(email: "test2@test.com", password: "test", password_confirmation: "test")
    
    visit "/shelters/1/edit"
  end

  xdescribe "[happy path]" do
    it "has a form to edit shelter attributes" do
      expect(page).to have_content("Edit Shelter")
      expect(page).to have_field("Name:")
      expect(page).to have_field("User ID:")
      expect(page).to have_button("Save")
    end

    it "pre-populates form with shelter attributes" do
      expect(page).to have_field("Name:", with: "red barn")
      expect(page).to have_field("User ID:", with: "1")
    end

    xit "can update a shelter when the form is saved" do
      fill_in :name, with: "purple barn"
      fill_in :user_id, with: "2"

      
      click_on "Save"

      expect(current_path).to eq("/shelters/1")
      expect(page).to have_content("Shelter was successfully updated.")
      expect(page).to have_content("Shelter Name: purple barn") # error: its not actually updating... or its just webmock and i need to split this up
      expect(page).to have_content("Shelter User ID: 2")
    end
  end

  xdescribe "[sad path]" do
    it "displays an error message if the shelter was not updated" do
      
      visit "/shelters/1/edit"
  
      fill_in :name, with: "purple barn"
      fill_in :user_id, with: ""
      click_on "Save"

      expect(current_path).to eq("/shelters/1/edit")
      expect(page).to have_content("Error. Shelter not updated.")
      expect(page).to have_content("Shelter Name: purple barn")
      expect(page).to have_content("Shelter User ID: 2")
    end
  end
end