require 'rails_helper'

RSpec.feature "DashboardHasLegislatorFundings", type: :feature, vcr: true do
  scenario "can see each politicians bills" do
    stub_omniauth
    login_user_with_address
    visit root_path

    within("#state-legislators") do
      expect(page).to have_content("Michael")
      within("#johnston-funding") do
        expect(page).to have_content("Funding data not provided for state legislators.")
      end
    end

    within("#national-congresspeople") do
      expect(page).to have_content("Bennet")
      expect(page).to have_content("Funding Data")
      within("#bennet-funding") do
        expect(page).to have_content("Total contributions: $5,525,238.0")
        expect(page).to have_content("Cash on hand: $5,387,554.0")
      end
      within("#gardner-funding") do
        expect(page).to have_content("Total contributions: $11,199,689.0")
        expect(page).to have_content("Cash on hand: $277,053.0")
      end
    end
  end
end
