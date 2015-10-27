require 'rails_helper'

RSpec.feature "DashboardContents", type: :feature do

  before do
    stub_omniauth
    login_user
  end

  scenario "navbar has appropriate links" do
    expect(page).to have_css("#navbar")
    within("#navbar") do
      expect(page).to have_content("Hello, travishaby")
      expect(page).to have_content("Logout")
      expect(page).to have_content("Policurious")
    end
    click_on "Logout"
    within("#navbar") do
      expect(page).to_not have_content("Hello, travishaby")
      expect(page).to_not have_content("Logout")
      expect(page).to have_content("Login")
    end
  end

  scenario "body has columns for national and local data" do
    expect(page).to have_css("#state-politicians")
    expect(page).to have_css("#national-politicians")
    within("#state-politicians") do
      expect(page).to have_content("Your State Representatives")
      expect(page).to have_content("Your State Senators")
    end
    within("#national-politicians") do
      expect(page).to have_content("Your National Representatives")
      expect(page).to have_content("Your National Senators")
    end
  end

end
