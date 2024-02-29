require "rails_helper"

RSpec.describe "Edit an Animal", type: :feature do
  it "has a link to an edit an animal form" do
    visit "/shelters/1/animals/1"
    expect(page).to have_content("Tom")
    expect(page).to have_content("orange")

    click_button "Edit this animal"

    expect(current_path).to eq("/shelters/1/animals/1/edit")
  end


  it "can edit an animals info" do
    visit "/shelters/1/animals/1"
    click_button "Edit this animal"

    expect(current_path).to eq("/shelters/1/animals/1/edit")
    fill_in "name", with: "Henry"
    fill_in "color", with: "black and grey"
    click_button "Confirm Edit"
    expect(current_path).to eq("/shelters/1/animals/1")
    expect(page).to have_content("Henry")
    expect(page).to have_content("black and grey")
  end
end