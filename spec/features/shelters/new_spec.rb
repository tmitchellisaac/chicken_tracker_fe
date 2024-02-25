require "rails_helper"

RSpec.describe "New Shelter Page" do

  before(:each) do
    @user = User.create(email: "test@test.com", password: "test")
    visit "/shelters/new" # can we change this to /users/:id/shelters/new so we can pre-populate the user_id from the params?
  end

  it "has a form to create a new shelter", :vcr do
    # json_response = File.read('spec/fixtures/shelter_1.json')
    # stub_request(:post, "http://localhost:3000/api/v1/shelters/1").
    # to_return(status: 200, body: json_response, headers: {})

    # stub_request(:get, "http://localhost:3000/api/v1/shelters/1").
    # with(
    #   headers: {
    #  'Accept'=>'*/*',
    #  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #  'User-Agent'=>'Faraday v2.9.0'
    #   }).
    # to_return(status: 200, body: "", headers: {})

    expect(page).to have_content("New Shelter")
    expect(page).to have_content("Name: ")
    expect(page).to have_content("User Id: ")
    expect(page).to have_button("Save")
  end

  xit "can create a new shelter", :vcr do
    # json_response = File.read('spec/fixtures/shelter_1.json')
    # stub_request(:post, "http://localhost:3000/api/v1/shelters/1").
    # to_return(status: 200, body: json_response, headers: {})

    fill_in :name, with: "red barn"
    fill_in :user_id, with: @user.id

    click_on "Save"
    shelter = Shelter.last

    expect(shelter.name).to eq("red barn")
    expect(shelter.user_id).to eq(@user.id)

    within("#My_Shelters") do
      expect(current_path).to eq(user_path)
      expect(page).to have_content("red barn")
    end
  end
end