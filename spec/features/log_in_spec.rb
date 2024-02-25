require 'rails_helper'

RSpec.describe "Logging In" do
  before(:each) do
    @user = User.create(email: "test@test.com", password: "test")
  end

  xit "can log in with valid credentials" do
    visit log_in_path
     
    # stub_request(:get, "http://localhost:3000/api/v1/shelters?user_id=141").
    #   with(
    #     headers: {
    #    'Accept'=>'*/*',
    #    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #    'User-Agent'=>'Faraday v2.9.0'
    #     }).
    #   to_return(status: 200, body: "", headers: {})

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on "Log In"

    expect(current_path).to eq("/users/#{@user.id}")
  end

  it "cannot log in with bad credentials" do
    visit log_in_path
  
    fill_in :email, with: @user.email
    fill_in :password, with: "incorrect password"
  
    click_on "Log In"

    expect(current_path).to eq(log_in_path)
    expect(page).to have_content("Unable to log in. Please try again")
  end
end