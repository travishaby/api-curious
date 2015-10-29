require 'rails_helper'

RSpec.feature "StatePoliticiansDisplayeds", type: :feature, vcr: true do
  scenario "can see state politicians displayed on dashboard" do
    stub_omniauth
    login_user_with_address
    visit root_path

    expect(Legislator.count).to eq(5)
    expect(user.state_legislators.second.full_name).to eq("Michael Johnston")
    within("#state-legislators") do
      expect(page).to have_content("Michael Johnston")
      expect(page).to have_content("McCann")
    end
  end
end
