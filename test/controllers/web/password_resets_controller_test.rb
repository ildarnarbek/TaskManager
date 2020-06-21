require 'test_helper'

class Web::PasswordResetsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    user = create(:user)
    attrs = attributes_for(:user, email: user.email)

    assert_emails 1 do
      post :create, params: { password_reset_form: attrs }
    end

    assert_response :success
  end

  test 'should get edit' do
    user = create(:user)
    user.generate_token

    get :edit, params: { id: user.password_reset_token }

    assert_response :success
  end

  test 'should put update' do
    user = create(:user)
    user.generate_token
    password = generate(:password)
    attrs = { id: user.password_reset_token, developer: { password: password, password_confirmation: password } }

    put :update, params: attrs

    assert_redirected_to new_session_path
  end
end
