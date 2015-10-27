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

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Capybara::DSL, type: :feature
  Capybara.app = ApiCurious::Application

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
