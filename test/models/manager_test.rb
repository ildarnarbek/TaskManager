require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "create" do
    developer = create :manager
    assert developer.persisted?
  end
end