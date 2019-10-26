# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:taro)
  end

  test "本のコメントを表示する" do
    book = books(:tdd)
    comment = comments(:comment_tdd)

    visit book_url("en", book.id)

    within "div.comment" do
      assert_equal comment.user.name, find("p.comment_name").text
      assert_equal comment.content, find("pre.comment_content").text
    end
  end

  test "日報のコメントを表示する" do
    report = reports(:report_taro)
    comment = comments(:comment_report_taro)

    visit report_url("en", report.id)

    within "div.comment" do
      assert_equal comment.user.name, find("p.comment_name").text
      assert_equal comment.content, find("pre.comment_content").text
    end
  end

  test "本にコメントを投稿する" do
    book = books(:tdd)
    visit book_url("en", book.id)

    fill_in "comment[content]", with: "コメントを投稿します"
    click_on "Post comment"

    assert_text "Your comment was successfully posted"
  end

  test "本のコメントを編集する" do
    book = books(:tdd)
    visit book_url("en", book)

    within "div.comment" do
      click_on "Edit"
      fill_in "comment[content]", with: "コメントを編集します"
      click_on "Save"
    end

    assert_text "Your comment was successfully updated"
  end

  test "本のコメントを削除する" do
    book = books(:tdd)
    visit book_url("en", book)

    within "div.comment" do
      click_on "Destroy"
    end

    assert_text "Your comment was successfully destroyed"
  end
end
