require "rails_helper"

RSpec.describe "New Shelter Page" do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "test")
    visit "/shelters/new" # can we change this to /users/:id/shelters/new so we can pre-populate the user_id from the params?
  end

  describe "[happy path]" do
    it "has a form to create a new shelter" do
      expect(page).to have_content("New Shelter")
      expect(page).to have_content("Name: ")
      expect(page).to have_content("User ID:")
      expect(page).to have_button("Save")
    end

    it "can create a new shelter", :vcr do
      fill_in :name, with: "red barn"
      fill_in :user_id, with: @user.id

      click_on "Save" # error happens here
      # binding.pry

      expect(page).to have_content("Shelter successfully created")
      expect(current_path).to eq("/shelters/1")


      expect(shelter.name).to eq("red barn")
      expect(shelter.user_id).to eq(@user.id)

      within("#My_Shelters") do
        expect(current_path).to eq(user_path)
        expect(page).to have_content("red barn")
      end
    end
  end
end