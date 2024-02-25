require "spec_helper"
require_relative "../../app/poros/animal" # <-- I don't know why this is needed

RSpec.describe Animal do
  it "exists" do
    attr = {:id=>"1",
    :type=>"animal",
    :attributes=>
     {:shelter_id=>1,
      :name=>"Tom",
      :species=>"chicken",
      :birthday=>"2023-03-03",
      :color=>"orange",
      :main_prey=>"Seeds, Fruit, Insects, Berries",
      :habitat=>"Open woodland and sheltered grassland",
      :diet=>"Omnivore",
      :skin_type=>"Feathers",
      :top_speed=>"6 mph",
      :avg_litter=>"2",
      :lifespan=>"2 - 4 years",
      :weight=>"1kg - 3kg (2.2lbs - 6.6lbs)",
      :lifestyle=>"Flock",
      :fav_food=>"Seeds"},
    :relationships=>{:shelter=>{:data=>{:id=>"1", :type=>"shelter"}}}}
    animal = Animal.new(attr)

    expect(animal).to be_a(Animal)
    expect(animal.id).to eq(attr[:id])
    expect(animal.name).to eq(attr[:attributes][:name])
    expect(animal.species).to eq(attr[:attributes][:species])
    expect(animal.birthday).to eq(attr[:attributes][:birthday])
    expect(animal.color).to eq(attr[:attributes][:color])
  end
end