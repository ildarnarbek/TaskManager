require 'simplecov'
require 'coveralls'

SimpleCov.start
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include ActionMailer::TestHelper
  include AuthHelper
end
