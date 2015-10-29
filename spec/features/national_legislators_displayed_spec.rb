require 'rails_helper'

RSpec.feature "NationalPoliticiansDisplayeds", type: :feature, vcr: true do
  scenario "can see national politicians displayed on dashboard" do
    stub_omniauth
    login_user_with_address
    visit root_path

    expect(Legislator.count).to eq(0)
    expect(user.national_legislators.second.full_name).to eq("Michael Johnston")
    within("#national-legislators") do
      expect(page).to have_content("Michael Johnston")
      expect(page).to have_content("McCann")
    end
  end
end
