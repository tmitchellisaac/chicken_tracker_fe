require "rails_helper"

RSpec.describe "Edit a Shelter" do

  # Simulate a user logging in to fix the navbar issue
  before :each do
    @user = User.create!(email: "fix@navbar.com", password: "password", password_confirmation: "password", id: 77)
    user_shelters = File.read("spec/fixtures/user_shelters.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=77").
      to_return(status: 200, body: user_shelters, headers: {})
    visit log_in_path
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Submit"
  end

  before(:each) do
    @user_1 = User.create(email: "test@test.com", password: "test", password_confirmation: "test")
    @user_2 = User.create(email: "test2@test.com", password: "test", password_confirmation: "test")

    json_response = File.read('spec/fixtures/shelter_1.json')
    stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
      to_return(status: 200, body: json_response, headers: {})
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
      to_return(status: 200, body: json_response, headers: {})
    
    visit "/shelters/1/edit"
  end

  describe "[happy path]" do
    # commented out any user_id related tests because the user_id is not editable / I believe it was dropped off at some point
    it "has a form to edit shelter attributes" do
      expect(page).to have_content("Edit Shelter")
      expect(page).to have_field(:shelter_name)
      # expect(page).to have_field("User ID:")
      expect(page).to have_button("Save Shelter")
    end

    it "pre-populates form with shelter attributes" do
      expect(page).to have_field(:shelter_name, with: "red barn")
      # expect(page).to have_field("User ID:", with: "1")
    end

    it "can update a shelter when the form is saved" do
      fill_in :shelter_name, with: "purple barn"
      # fill_in :user_id, with: "2"

      get_shelter = File.read('spec/fixtures/shelter_1.json')
      stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
      to_return(status: 200, body: get_shelter, headers: {})

      # Stub the PATCH request for updating the shelter
      updated_json_response = File.read('spec/fixtures/shelter_update.json')
      stub_request(:patch, "http://localhost:5000/api/v1/shelters/1").
        with(
          body: "{\"shelter\":{\"name\":\"purple barn\",\"user_id\":\"2\"}}",
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Content-Type'=>'application/json',
            'User-Agent'=>'Faraday v2.9.0'
          }
        ).
        to_return(status: 200, body: updated_json_response, headers: {})
      
      click_on "Save"

      expect(current_path).to eq("/shelters/1")
      expect(page).to have_content("Shelter was successfully updated.")
      expect(page).to have_content("Shelter Name: purple barn") # error: its not actually updating... or its just webmock and i need to split this up
      expect(page).to have_content("Shelter User ID: 2")
    end
  end

  xdescribe "[sad path]" do
    it "displays an error message if the shelter was not updated" do
      json_response = File.read('spec/fixtures/shelter_1.json')
      stub_request(:patch, "http://localhost:5000/api/v1/shelters/1").
      to_return(status: 200, body: json_response, headers: {})
      
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