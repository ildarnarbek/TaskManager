require 'simplecov'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'sidekiq/testing'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include ActionMailer::TestHelper
  include AuthHelper
end
