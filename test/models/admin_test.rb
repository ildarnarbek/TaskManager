require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "create" do
    developer = create :admin
    assert developer.persisted?
  end
end