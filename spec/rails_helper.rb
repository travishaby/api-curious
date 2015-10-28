ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    provider: 'twitter',
    extra: {
      raw_info: {
        user_id: "1234",
        name: "Travis",
        screen_name: "travishaby"
      }
    },
    credentials: {
      token: "whatever",
      secret: "secretwhatever"
    }
    })
end

def login_user
  visit "/"
  expect(page.status_code).to eq(200)
  click_link "Login"
end

def login_user_with_address
  visit "/"
  expect(page.status_code).to eq(200)
  click_link "Login"
  address
  visit "/"
end

def user
  @user ||= User.find_by(screen_name: "travishaby")
end

def address
  user
  @address ||= Address.find_or_create_by(street: "3216 St. Paul St.", city: "Denver", state: "CO", zip_code: "80205", user_id: user.id)
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Capybara::DSL, type: :feature
  Capybara.app = ApiCurious::Application

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
