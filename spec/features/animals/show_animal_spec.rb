require "rails_helper"

RSpec.describe "Animal Show Page", type: :feature do
  describe "visit Animal Show Page" do

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

  # As a user,
  # When I visit "animal/:id"
  # I see "Animal Show"
    it "displays the page title" do
      # stub not created yet!!!
      # WebMock.allow_net_connect!
      json_response = File.read('spec/fixtures/animals_show.json')
      # stub_request(:get, "http://localhost:3000/api/v1/animals/1").
      # to_return(status: 200, body: json_response, headers: {})
      animal = Animal.new(JSON.parse(json_response, symbolize_names: true)[:data])

      stub_request(:get, "http://localhost:5000/api/v1/shelters/#{animal.shelter_id}/animals/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

         stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: json_response, headers: {})
      # visit "/shelters/1/animals/1"

      visit "/shelters/#{animal.shelter_id}/animals/#{animal.id}"
      expect(current_path).to eq("/shelters/#{animal.shelter_id}/animals/#{animal.id}")
      expect(page).to have_content("Animal Show Page")
    end
  end

  describe "Animal Age" do

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

    it "displays the age of the animal on the show page" do
      json_response = File.read('spec/fixtures/animals_show.json')
      animal = Animal.new(JSON.parse(json_response, symbolize_names: true)[:data])

      stub_request(:get, "http://localhost:5000/api/v1/shelters/#{animal.shelter_id}/animals/1").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
          }).
          to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals/1").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body: json_response, headers: {})

      visit "/shelters/#{animal.shelter_id}/animals/#{animal.id}"
      expect(current_path).to eq("/shelters/#{animal.shelter_id}/animals/#{animal.id}")

      # This test assumes DateTime.now = "2024/03/17", change it in show.html.erb for a passing test
      expect(page).to have_content("Age: 1 year(s), 0 month(s), 14 day(s)")
    end
  end
end
