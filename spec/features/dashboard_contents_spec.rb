require 'rails_helper'

RSpec.feature "DashboardContents", type: :feature do

  before do
    stub_omniauth
    login_user
  end

  scenario "dashboard has a navbar with appropriate links" do
    expect(page).to have_css("#navbar")
    within("#navbar") do
      expect(page).to have_content("Logged in as travishaby")
      expect(page).to have_content("Logout")
      expect(page).to have_content("Policurious")
    end
  end
  
end
