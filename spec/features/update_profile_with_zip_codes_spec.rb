require 'rails_helper'

RSpec.feature "UpdateProfileWithZipCodes", type: :feature do

  before do
    stub_omniauth
    login_user
    mock_geocoder
  end

  scenario "user without address visits main page" do
    visit root_path
    expect(user.address).to_not be
    expect(page).to have_content("Please update your profile with your address
    to see information about your area's politicians:")
  end

  scenario "user submits address and reaches full dashboard" do
    visit root_path
    expect(page).to_not have_css("#state-politicians")
    expect(page).to_not have_css("#national-politicians")

    fill_in "address[street]", with: "3216 St. Paul St."
    fill_in "address[city]", with: "Denver"
    fill_in "address[state]", with: "CO"
    fill_in "address[zip_code]", with: "80205"
    click_on "Update Profile"

    expect(current_path).to eq(root_path)
    expect(page).to have_css("#state-politicians")
    expect(page).to have_css("#national-politicians")
    expect(user.screen_name).to eq("travishaby")
    expect(user.latitude).to eq(39.762471)
    expect(user.longitude).to eq(-104.950796)
  end
end
