# frozen_string_literal: true

require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:taro)
    @book = books(:tdd)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url("en")
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { memo: @book.memo, title: @book.title, author: @book.author, user_id: @book.user_id } }
    end

    assert_redirected_to book_url("en", Book.last)
  end

  test "should show book" do
    get book_url("en", @book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url("en", @book)
    assert_response :success
  end

  test "should update book" do
    patch book_url("en", @book), params: { book: { memo: @book.memo, title: @book.title } }
    assert_redirected_to book_url("en", @book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url("en", @book)
    end

    assert_redirected_to books_url
  end
end
