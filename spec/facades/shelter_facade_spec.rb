require "rails_helper"

RSpec.describe ShelterFacade do
  before do
    json_response = File.read('spec/fixtures/shelter_1.json')
    stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
    to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
    with(
      headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.9.0'
      }).
    to_return(status: 200, body: json_response, headers: {})

    @facade = ShelterFacade.new(id: 1, name: "red barn", user_id: "1")
    @shelter = @facade.shelter
  end

  describe "#shelter" do
    it "can call an api and create a shelter poros" do
      shelters_animals = File.read("spec/fixtures/animals_index.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body:  shelters_animals, headers: {})

      expect(@shelter).to be_a(Shelter)
      expect(@shelter.id).to eq(1)
      expect(@shelter.name).to eq("red barn")
      expect(@shelter.user_id).to eq(1)
    end
  end

  describe "num_of_animals" do
    it "counts the number of animals in a shelter" do
      shelters_animals = File.read("spec/fixtures/animals_index.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body:  shelters_animals, headers: {})

      expect(@facade.num_of_animals).to eq(5)

      shelters_animals = File.read("spec/fixtures/animals_index_2.json")
      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body:  shelters_animals, headers: {})

      facade = ShelterFacade.new(id: 1, name: "red barn", user_id: "1")

      expect(facade.num_of_animals).to eq(3)
    end
  end

  describe "animal_species" do
    context "one or more species" do
      it "lists the species in an array" do
        shelters_animals = File.read("spec/fixtures/animals_index.json")
        stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body:  shelters_animals, headers: {})

        expect(@facade.animal_species).to eq(["Chicken"])

        shelters_animals = File.read("spec/fixtures/animals_index_2.json")
        stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals").
        with(
          headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
          }).
        to_return(status: 200, body:  shelters_animals, headers: {})

        facade = ShelterFacade.new(id: 1, name: "red barn", user_id: "1")

        expect(facade.animal_species.sort).to eq(["Chicken", "Goat", "Rabbit"].sort)
      end
    end
  end
end
