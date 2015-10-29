require 'rails_helper'

RSpec.feature "DashboardShowsBillsPassed", type: :feature, vcr: true do
  xscenario "can see each politicians bills" do
    stub_omniauth
    login_user_with_address
    visit root_path

    within("#national-congresspeople") do
      expect(page).to have_content("Cory")
      within("#national-sen-bills") do
        expect(page).to have_content("some bill")
        expect(page).to_not have_content("some reps bill")
      end
      within("#national-rep-bills") do
        expect(page).to have_content("some bill")
      end
    end

    within("#state-legislators") do
      expect(page).to have_content("Cory")
      within("#state-sen-bills") do
        expect(page).to have_content("some bill")
        expect(page).to_not have_content("some reps bill")
      end
      within("#state-rep-bills") do
        expect(page).to have_content("some bill")
      end
    end
  end
end
