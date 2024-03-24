require 'rails_helper'

RSpec.describe "Registering a new user" do
  before(:each) do
    @user_1 = User.create!(email: "goodboy@gmail.com", password: "password")
    visit "/users/new"

    shelters_index = File.read("spec/fixtures/shelters_index.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=#{@user_1.id+1}").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelters_index, headers: {})
  end

  it "displays a form to create a new user" do
    
    expect(page).to have_content("E-mail")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_button("Create User")
  end

  it "can create a new user" do
    fill_in :user_email, with: "test@test.com"
    fill_in :user_password, with: "test"
    fill_in :user_password_confirmation, with: "test"
    click_on "Create User" # clicking Submit seems to make a request, but its not stubbed, so its erroring here. I can't tell which request its trying to call so not sure what to stub exactly.

    # binding.pry
    # why isn't the user being created? (run User.last in pry)

    expect(current_path).to eq("/users/#{User.last.id}")
  end

  it "cannot create a user if password_confirmation does not match password" do
    fill_in :user_email, with: "test@test.com"
    fill_in :user_password, with: "test"
    fill_in :user_password_confirmation, with: "something else"
  
    click_on "Create User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("User not created. Please ensure password and password confirmation match.")
  end

  it "has a link to Log In" do
    expect(page).to have_button("Log In with Email")

    click_button("Log In with Email")

    expect(current_path).to eq(log_in_path)
  end
end