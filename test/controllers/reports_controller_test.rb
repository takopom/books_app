# frozen_string_literal: true

require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:taro)
    @report = reports(:report_taro)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url("en")
    assert_response :success
  end

  test "should create report" do
    assert_difference("Report.count") do
      post reports_url, params: { report: { description: @report.description, reported_on: @report.reported_on, title: @report.title, user_id: @report.user_id } }
    end

    assert_redirected_to report_url("en", Report.last)
  end

  test "should show report" do
    get report_url("en", @report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url("en", @report)
    assert_response :success
  end

  test "should update report" do
    patch report_url("en", @report), params: { report: { description: @report.description, reported_on: @report.reported_on, title: @report.title, user_id: @report.user_id } }
    assert_redirected_to report_url("en", @report)
  end

  test "should destroy report" do
    assert_difference("Report.count", -1) do
      delete report_url("en", @report)
    end

    assert_redirected_to reports_url
  end
end
