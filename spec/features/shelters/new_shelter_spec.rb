require "rails_helper"

RSpec.describe "New Shelter Page" do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "test")
    visit "/shelters/new"
  end

  describe "[happy path]" do
    it "has a form to create a new shelter" do
      expect(page).to have_content("New Shelter")
      expect(page).to have_content("Name: ")
      expect(page).to have_content("User ID:")
      expect(page).to have_button("Save")
    end

    xit "can create a new shelter" do
      fill_in :name, with: "red barn"
      fill_in :user_id, with: "#{@user.id}"

      # binding.pry
      click_on "Save" # error happens here

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

  xdescribe "[sad path]" do
    it "does not create a new shelter if missing information", :vcr do
      fill_in :name, with: "red barn"
      fill_in :user_id, with: ""

      click_on "Save" # error happens here

      expect(page).to have_content("Shelter not created, try again.")
      expect(current_path).to eq("/shelters/new")
      expect(status_code).to eq(400)

      expect(shelter.name).to eq("red barn")
      expect(shelter.user_id).to eq(@user.id)

      within("#My_Shelters") do
        expect(current_path).to eq(user_path)
        expect(page).to have_content("red barn")
      end
    end
  end
end