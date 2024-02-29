require "rails_helper"
# require_relative "../../app/poros/shelter"# <-- I don't know why this is needed

RSpec.describe Shelter do
  it "exists" do
    # attr = {
    #   id: "1",
    #   attributes: {
    #     name: "McClucky's Coupe Coop: A Chic Chicken Coup Shelter",
    #     user_id: "1" 
    #   } 
    # }

    attr = {
        :data=>{
            :id=>"1",
            :type=>"shelter",
            :attributes=>{
                :name=>"McClucky's Coupe Coop: A Chic Chicken Coup Shelter",
                :user_id=>1
            },
            :relationships=>{
                :animals=>{
                    :data=>[]
                }
            }
        }
    }

    shelter = Shelter.new(attr)

    expect(shelter).to be_a(Shelter)
    expect(shelter.id).to eq(1)
    expect(shelter.name).to eq(attr[:data][:attributes][:name])
    expect(shelter.user_id).to eq(attr[:data][:attributes][:user_id].to_i)
  end
end