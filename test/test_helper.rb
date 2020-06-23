require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start


ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include AuthHelper
end
