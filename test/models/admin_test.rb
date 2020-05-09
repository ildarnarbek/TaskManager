require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "create" do
    developer = create :admin
    assert developer.persisted?
  end
end