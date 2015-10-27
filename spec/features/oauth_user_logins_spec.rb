require 'rails_helper'

RSpec.describe "UserLogsInWithTwitter", type: :feature do
  before do
    stub_omniauth
  end

  describe "logging in" do
    scenario "basic login" do
      visit "/"
      expect(page.status_code).to eq(200)
      click_link "Login"
      expect(current_path).to eq("/")
      expect(page).to have_content("travishaby")
      expect(page).to have_content("Logout")
    end
  end
end
