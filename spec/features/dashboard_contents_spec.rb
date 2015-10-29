require 'rails_helper'

RSpec.feature "DashboardContents", type: :feature do

  before do
    stub_omniauth
    login_user_with_address
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
    expect(page).to have_css("#state-legislators")
    expect(page).to have_css("#national-congresspeople")
    within("#state-legislators") do
      expect(page).to have_content("State Representative")
      expect(page).to have_content("State Senator")
    end
    within("#national-congresspeople") do
      expect(page).to have_content("National Representative")
      expect(page).to have_content("National Senators")
    end
  end

end
