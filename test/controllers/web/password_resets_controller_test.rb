require 'test_helper'

class Web::PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get web_password_resets_new_url
    assert_response :success
  end

end
