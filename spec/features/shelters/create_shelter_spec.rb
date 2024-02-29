require "rails_helper"

RSpec.describe "Create a Shelter" do
    before(:each) do 
        @user = User.create(email: "test@test.com", password: "test", password_confirmation: "test", id: 689)
    end

    it "Shelter Create" do


        # When I visit 'shelter/new' (or click the New Shelter button on the home page)
        visit '/shelters/new'
        # Then I see a form
        # And I fill in the form with 'name' and 'user_id'
        fill_in :name, with: "red barn"
        fill_in :user_id, with: "#{@user.id}"
        # And I click the 'save' button
        click_button "Save"
        # And I am taken to the home page where I see the new shelter’s name under “My Shelters”
        expect(current_path).to eq("/shelters/1")
        expect(page).to have_content("red barn")
    end
end