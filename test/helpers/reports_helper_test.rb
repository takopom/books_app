# frozen_string_literal: true

require "test_helper"

class ReportsHelperTest < ActionView::TestCase
  test "Markdown形式のテキストを、HTML文字列にする" do
    text = "# ヘッダー1\n## ヘッダー2\n こんにちは"
    assert_dom_equal "<h1>ヘッダー1</h1>\n\n<h2>ヘッダー2</h2>\n\n<p>こんにちは</p>\n", markdown(text)
  end
end
