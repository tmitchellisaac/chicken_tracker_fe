require 'rails_helper'

RSpec.describe "New User Registration" do

  before(:each) do
    @user_shelters = File.read("spec/fixtures/user_shelters.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=197").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: @user_shelters, headers: {})
    visit(new_user_path)
  end

  it "has a form to register a new user" do
    expect(page).to have_field(:user_email)
    expect(page).to have_field(:user_password)
    expect(page).to have_field(:user_password_confirmation)
    expect(page).to have_button("Create User")
  end

  describe "[happy path]" do
    it "can register a new user" do

      user_1 = User.create!(email: "group@email.com", password: "testy")
      fill_in :user_email, with: "test@test.com"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"
      
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=#{user_1.id+1}").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: @user_shelters, headers: {})

      click_on "Create User"

      user = User.last

      expect(current_path).to eq("/users/#{user.id}")
    end
  end

  describe "[sad path]" do
    it "cannot register a new user if email is taken" do
      user = User.create(email: "test@test.com", password: "test", id: 197)

      fill_in :user_email, with: "test@test.com"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "test"

      click_on "Create User"

      expect(current_path).to eq("/users/new")
      expect(page).to have_content("Unable to create user. Please try again.")
    end

    it "cannot register a new user if password and password confirmation do not match" do
      fill_in :user_email, with: "test@test.com"
      fill_in :user_password, with: "test"
      fill_in :user_password_confirmation, with: "something else"

      click_on "Create User"

      expect(current_path).to eq("/users/new")
      expect(page).to have_content("User not created. Please ensure password and password confirmation match.")
    end
  end
end