require "rails_helper"

RSpec.describe "Delete an Animal", type: :feature do
  it "has a link to delete an animal" do

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