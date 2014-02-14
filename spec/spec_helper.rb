# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'turnip'
require 'turnip/capybara'

require 'coveralls'
Coveralls.wear!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir.glob("spec/**/*steps.rb") { |f| load f, true }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.before(:all) do
    FactoryGirl.reload
  end
end
