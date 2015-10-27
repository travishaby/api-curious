require 'rails_helper'

RSpec.feature "UpdateProfileWithZipCodes", type: :feature do

  before do
    stub_omniauth
    login_user
  end

  scenario "user without zip code visits main page" do
    visit root_path
    expect(user.address).to_not be
    expect(page).to have_content("Please update your profile with your address
    to see information about your area's politicians.")
  end

end
