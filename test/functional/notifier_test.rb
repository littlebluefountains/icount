require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "daily_stock_summary" do
    mail = Notifier.daily_stock_summary
    assert_equal "Daily stock summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "daily_sales_summary" do
    mail = Notifier.daily_sales_summary
    assert_equal "Daily sales summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "supply_summary" do
    mail = Notifier.supply_summary
    assert_equal "Supply summary", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
