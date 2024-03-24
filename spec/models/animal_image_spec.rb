require 'rails_helper'

describe AnimalImage, type: :model do
  describe "validations" do
    it {should have_one_attached(:image)}
  end
end