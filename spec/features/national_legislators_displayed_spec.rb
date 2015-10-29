require 'rails_helper'

RSpec.feature "NationalPoliticiansDisplayeds", type: :feature, vcr: true do
  scenario "can see national politicians displayed on dashboard" do
    stub_omniauth
    login_user_with_address
    visit root_path

    expect(Legislator.count).to eq(5)
    expect(user.national_legislators.second.first_name).to eq("Diana")

    within("#national-congresspeople") do
      expect(page).to have_content("Cory")
      expect(page).to have_content("Bennet")
      expect(page).to_not have_content("Michael Johnston")
    end
  end
end
