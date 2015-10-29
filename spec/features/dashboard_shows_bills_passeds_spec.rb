require 'rails_helper'

RSpec.feature "DashboardShowsBillsPassed", type: :feature, vcr: true do
  scenario "can see each politicians bills" do
    stub_omniauth
    login_user_with_address
    visit root_path
    save_and_open_page
    within("#state-legislators") do
      expect(page).to have_content("Michael")
      within("#johnston-bills") do
        expect(page).to have_content("Police Data Collection And Community Policing")
      end
      within("#mccann-bills") do
        expect(page).to have_content("Education To Prevent Child Sexual Abuse & Assault")
      end
    end

    within("#national-congresspeople") do
      expect(page).to have_content("Cory")
      within("#michael-bennet-bills") do
        expect(page).to have_content("Higher Education Innovation Act Congress")
        expect(page).to_not have_content("Police Data Collection And Community Policing")
      end
      within("#diana-degette-bills") do
        expect(page).to have_content("Colorado Wilderness Act of 2015")
      end
    end
  end
end
