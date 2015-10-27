require 'rails_helper'

RSpec.describe "UserLogsInWithTwitter", type: :feature do
  before do
    stub_omniauth
    login_user
  end

  scenario "basic login" do
    expect(current_path).to eq("/")
    expect(page).to have_content("travishaby")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end

  scenario "user logs out" do
    click_link "Logout"
    expect(current_path).to eq("/")
    expect(page).to_not have_content("travishaby")
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login")
  end
end
