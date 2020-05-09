require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  test "create" do
    developer = create :manager
    assert developer.persisted?
  end
end