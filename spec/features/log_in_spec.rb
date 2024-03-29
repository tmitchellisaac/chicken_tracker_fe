require 'rails_helper'

RSpec.describe "Logging In" do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "test", password_confirmation: "test", id: 77)

    user_shelters = File.read("spec/fixtures/user_shelters.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=77").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: user_shelters, headers: {})

    # json_response = File.read("spec/fixtures/shelters_index.json")
    # stub_request(:get, "http://localhost:5000/api/v1/shelters?user_id=77").
    #      with(
    #        headers: {
    #       'Accept'=>'*/*',
    #       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #       'User-Agent'=>'Faraday v2.9.0'
    #        }).
    #      to_return(status: 200, body: json_response, headers: {})
         
    visit log_in_path
  end
  
  it "has a log in form" do
    expect(page).to have_field(:user_email)
    expect(page).to have_field(:user_password)
    expect(page).to have_button("Sign In")
  end

  it "can log in with valid credentials" do
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: @user.password

    click_on "Sign In"

    expect(current_path).to eq("/users/#{@user.id}")
  end

  it "cannot log in with bad credentials" do
    fill_in :user_email, with: @user.email
    fill_in :user_password, with: "incorrect password"
  
    click_on "Sign In"

    expect(current_path).to eq(log_in_path)
    expect(page).to have_content("Unable to log in. Please try again")
  end

  it "has a button to register" do
    expect(page).to have_button("Register")

    click_on "Register"
  
    expect(current_path).to eq(new_user_path)
  end
end