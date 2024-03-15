require 'rails_helper'
require 'timecop'

RSpec.describe 'Session Timeout', type: :feature do 
  before :each do

    user_shelters = File.read("spec/fixtures/user_shelters.json")
    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters?user_id=169").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: user_shelters, headers: {})

    @user = User.create!(id: 169, email: "test@test.com", password: "test", password_confirmation: "test")
    visit log_in_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_button 'Submit'
  end

  xit 'logs out user after inactivity' do
    visit user_path(@user.id)
    Timecop.travel(16.minutes.from_now) do
      visit user_path(@user.id)
      expect(current_path).to eq(log_in_path)
    end
  end

  it 'does not log out active user' do 
    visit user_path(@user.id)
    Timecop.travel(4.minutes.from_now) do
      visit user_path(@user.id)
      expect(current_path).to eq(user_path(@user.id))
    end
  end
end