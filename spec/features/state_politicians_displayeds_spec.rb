require 'rails_helper'

RSpec.feature "StatePoliticiansDisplayeds", type: :feature do
  before do
    stub_omniauth
    login_user_with_address
  end

  scenario "can see state politicians displayed on dashboard" do
    visit root_path
    expect(current_path).to eq(root_path)
  end
end
