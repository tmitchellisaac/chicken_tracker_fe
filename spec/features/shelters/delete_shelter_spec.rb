require "rails_helper"

RSpec.describe "Delete a Shelter" do
    before(:each) do 
        @user = User.create(email: "test@test.com", password: "test", password_confirmation: "test", id: 630)
    end

    it "Shelter Delete" do

        # When I visit a shelter’s show page 'users/shelters/:id'
        visit "/shelters/1"
        # Then I see a button to delete the shelter
        expect(page).to have_content("Delete Shelter")
        # And when I click this button, and there are no animals inside the shelter,
        click_on("Delete Shelter")
        # Then I am taken back to the home page and I no longer see that shelter listed there.
        expect(current_path).to eq("/users/#{@user.id}")
        expect(page).to_not have_content('Red Barn')
    end
end