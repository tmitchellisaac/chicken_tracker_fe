require "rails_helper"

RSpec.describe "Delete a Shelter" do

    # Simulate a user logging in to fix the navbar issue
    before :each do
      @user = User.create!(email: "test@test.com", password: "test", password_confirmation: "test", id: 630)
      user_shelters = File.read("spec/fixtures/user_shelters.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=630").
        to_return(status: 200, body: user_shelters, headers: {})
      visit log_in_path
      fill_in :user_email, with: @user.email
      fill_in :user_password, with: @user.password
      click_on "Sign In"
    end

    it "Shelter Delete" do
        shelters_delete1 = File.read("spec/fixtures/shelters_delete1.json")
        stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
        with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v2.9.0'
        }).
        to_return(status: 200, body: shelters_delete1, headers: {})

        stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelters_delete1, headers: {})

        stub_request(:delete, "http://localhost:5000/api/v1/shelters/1").
        with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Content-Type'=>'application/json',
                'User-Agent'=>'Faraday v2.9.0'
        }).
        to_return(status: 204, headers: {})

        stub_request(:delete, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 204, body: "", headers: {})
        
        shelters_delete2 = File.read("spec/fixtures/shelters_delete2.json")
        stub_request(:get, "http://localhost:5000/api/v1/shelters?user_id=1").
        with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v2.9.0'
        }).
        to_return(status: 200, body: shelters_delete2, headers: {})

        stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=630").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelters_delete2, headers: {})

        shelters_animals = File.read("spec/fixtures/animals_index.json")
        stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body: shelters_animals, headers: {})
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