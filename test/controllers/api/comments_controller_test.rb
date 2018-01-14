require 'test_helper'

class Api::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_comment = api_comments(:one)
  end

  test "should get index" do
    get api_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_api_comment_url
    assert_response :success
  end

  test "should create api_comment" do
    assert_difference('Api::Comment.count') do
      post api_comments_url, params: { api_comment: { —skip-template-engine: @api_comment.—skip-template-engine } }
    end

    assert_redirected_to api_comment_url(Api::Comment.last)
  end

  test "should show api_comment" do
    get api_comment_url(@api_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_comment_url(@api_comment)
    assert_response :success
  end

  test "should update api_comment" do
    patch api_comment_url(@api_comment), params: { api_comment: { —skip-template-engine: @api_comment.—skip-template-engine } }
    assert_redirected_to api_comment_url(@api_comment)
  end

  test "should destroy api_comment" do
    assert_difference('Api::Comment.count', -1) do
      delete api_comment_url(@api_comment)
    end

    assert_redirected_to api_comments_url
  end
end
