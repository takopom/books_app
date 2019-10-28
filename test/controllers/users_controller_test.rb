# frozen_string_literal: true

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "ユーザ情報を表示する" do
    user = users(:taro)
    sign_in user
    get user_url("en", user)
    assert_response :success
  end
end
