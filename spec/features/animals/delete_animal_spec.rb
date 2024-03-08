require "rails_helper"

RSpec.describe "Delete an Animal", type: :feature do
  it "has a link to delete an animal" do

    json_response = File.read("spec/fixtures/animals_show.json")

    stub_request(:get, "http://localhost:5000/api/v1/shelters/1/animals/1").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals/1").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

    stub_request(:delete, "http://localhost:5000/api/v1/shelters/1/animals/1").
      with(
        headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Content-Type'=>'application/json',
              'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 204, body: '', headers: {})

      stub_request(:delete, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1/animals/1").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Content-Type'=>'application/json',
       'User-Agent'=>'Faraday v2.9.0'
        }).
      to_return(status: 200, body: '', headers: {})

    shelter_show = File.read("spec/fixtures/shelter_1.json")
    
      stub_request(:get, "http://localhost:5000/api/v1/shelters/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelter_show, headers: {})

         stub_request(:get, "https://hidden-sands-71693-380133048218.herokuapp.com/api/v1/shelters/1").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.9.0'
           }).
         to_return(status: 200, body: shelter_show, headers: {})
         
    visit "/shelters/1/animals/1"
    expect(page).to have_content("Tom")
    expect(page).to have_content("orange")
    expect(page).to have_button("Delete this Animal")
    click_button "Delete this Animal"

    expect(current_path).to eq("/shelters/1")
    expect(page).to_not have_content("Tom")
    expect(page).to_not have_content("orange")


  end
    

  end