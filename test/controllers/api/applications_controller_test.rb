require 'test_helper'

class Api::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_application = api_applications(:one)
  end

  test "should get index" do
    get api_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_api_application_url
    assert_response :success
  end

  test "should create api_application" do
    assert_difference('Api::Application.count') do
      post api_applications_url, params: { api_application: { —skip-template-engine: @api_application.—skip-template-engine } }
    end

    assert_redirected_to api_application_url(Api::Application.last)
  end

  test "should show api_application" do
    get api_application_url(@api_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_application_url(@api_application)
    assert_response :success
  end

  test "should update api_application" do
    patch api_application_url(@api_application), params: { api_application: { —skip-template-engine: @api_application.—skip-template-engine } }
    assert_redirected_to api_application_url(@api_application)
  end

  test "should destroy api_application" do
    assert_difference('Api::Application.count', -1) do
      delete api_application_url(@api_application)
    end

    assert_redirected_to api_applications_url
  end
end
