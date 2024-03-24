require "rails_helper"

RSpec.describe "Create a Shelter" do

    # Simulate a user logging in to fix the navbar issue
    before :each do
      @user = User.create!(email: "test@test.com", password: "test", password_confirmation: "test", id: 689)
      user_shelters = File.read("spec/fixtures/user_shelters.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=689").
        to_return(status: 200, body: user_shelters, headers: {})
      visit log_in_path
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_on "Submit"
    end

    before(:each) do
        # commented out to fix restrict access issue
        @user = User.create(email: "test@test.com", password: "test", password_confirmation: "test", id: 689)
    end

    it "Shelter Create" do
        post_shelter_response = File.read("spec/fixtures/create_shelter_response.json")
        stub_request(:post, "http://localhost:5000/api/v1/shelters").
         with(
           body: "{\"shelter\":{\"user_id\":689,\"name\":\"red barn\"}}",
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Type'=>'application/json',
       	  'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: post_shelter_response, headers: {})

        shelter_1 = File.read("spec/fixtures/shelter_1.json")
        stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelter_1, headers: {})

         user_shelters = File.read("spec/fixtures/user_shelters.json")
         stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=689").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: user_shelters, headers: {})

         create_shelter = File.read("spec/fixtures/create_shelter_response.json")
         stub_request(:post, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters").
         with(
           body: "{\"shelter\":{\"user_id\":689,\"name\":\"red barn\"}}",
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: create_shelter, headers: {})

         stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: create_shelter, headers: {})
        
         animals_index = File.read("spec/fixtures/animals_index.json")
         stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: animals_index, headers: {})
        # When I visit 'shelter/new' (or click the New Shelter button on the home page)
       
        visit "/users/689"
        click_link "Create A Shelter!"
        # Then I see a form
        # And I fill in the form with 'name' and 'user_id'
        fill_in :shelter_name, with: "red barn"
        # And I click the 'save' button
        click_button "Save Shelter"
        # And I am taken to the home page where I see the new shelter’s name under “My Shelters”
        expect(page).to have_content("red barn")
    end
end