# Load the Rails application.
require File.expand_path('../application', __FILE__)

if Rails.env == "development"
  YAML.load_file("#{::Rails.root}/config/application.yml")[::Rails.env].each {|k,v| ENV[k] = v }
end
# Initialize the Rails application.
Rails.application.initialize!
