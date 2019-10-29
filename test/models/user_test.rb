# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @hanako = users(:hanako)
  end

  test "hanako は yamada をフォローする" do
    @hanako.follow(users(:yamada))
    assert @hanako.following.include?(users(:yamada))
  end

  test "hanako は taro をフォローしている" do
    assert @hanako.following?(users(:taro))
  end

  test "hanako は yamada をフォローしていない" do
    assert_not @hanako.following?(users(:yamada))
  end

  test "hanako は taro のフォローを解除する" do
    @hanako.unfollow(users(:taro))
    assert_not @hanako.following.include?(users(:taro))
  end
end
