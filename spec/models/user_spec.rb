require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password_digest)}
  end

  it "has secure password" do
    user = User.create!(email: 'test@test.com', password: "password123")

    expect(user).to_not have_attribute(:password)
    expect(user.password_digest).to_not eq('password123')
  end
end