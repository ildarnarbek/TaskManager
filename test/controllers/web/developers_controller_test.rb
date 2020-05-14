require 'test_helper'

class Web::DevelopersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    params = attributes_for(:developer)

    post :create, params: { developer: params }
    assert_response :redirect

    developer = Developer.find_by(first_name: params[:first_name])

    assert developer.present?
  end
end
