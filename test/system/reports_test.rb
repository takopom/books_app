# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:taro)
    @report = reports(:report_taro)
  end

  test "日報一覧を表示する" do
    visit reports_url
    assert_selector "h1", text: "Daily reports"
  end

  test "日報を作成する" do
    visit reports_url
    click_on "New report"

    fill_in "Title", with: @report.title
    fill_in "Description", with: @report.description
    select "2019", from: "report[reported_on(1i)]"
    select "October", from: "report[reported_on(2i)]"
    select "27", from: "report[reported_on(3i)]"
    click_on "Create Report"

    assert_text "Report was successfully created"
  end

  test "日報を編集する" do
    visit edit_report_url("en", @report.id)

    fill_in "Title", with: "タイトルです"
    select "2020", from: "report[reported_on(1i)]"
    select "January", from: "report[reported_on(2i)]"
    select "1", from: "report[reported_on(3i)]"
    fill_in "Description", with: "日報を編集します。"

    click_on "Update Report"

    assert_text "Report was successfully updated"
    assert_text "タイトルです"
    assert_text "日報を編集します。"
  end

  test "日報を削除する" do
    visit reports_url
    click_on "Destroy", match: :first
    page.accept_confirm "Are you sure"

    assert_text "Report was successfully destroyed"
  end
end
