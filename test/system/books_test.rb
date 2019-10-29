# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:yamada)
    @book = books(:futago)
  end

  test "本一覧を表示する" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "本を投稿する" do
    visit books_url
    click_on "New Book"

    fill_in "Memo", with: @book.memo
    fill_in "Title", with: @book.title
    click_on "Create Book"

    assert_text "Book was successfully created"
  end

  test "本を更新する" do
    visit books_url
    click_on "Show", match: :first

    within("div.menu") do
      click_on "Edit"
    end

    fill_in "Memo", with: @book.memo
    fill_in "Title", with: @book.title
    fill_in "Author", with: @book.author
    click_on "Update Book"

    assert_text "Book was successfully updated"
  end

  test "本を削除する" do
    visit books_url
    click_on "Show", match: :first

    within("div.menu") do
      click_on "Edit"
    end

    click_on "Destroy", match: :first
    page.accept_confirm "Are you sure"

    assert_text "Book was successfully destroyed"
  end
end
