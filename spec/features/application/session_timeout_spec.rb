require 'rails_helper'
require 'timecop'

RSpec.describe 'Session Timeout', type: :feature do 
  before :each do
    @user = User.create!(email: "test@test.com", password: "test", password_confirmation: "test")
    visit log_in_path
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test'
    click_button 'Submit'
  end

  it 'logs out user after inactivity' do
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