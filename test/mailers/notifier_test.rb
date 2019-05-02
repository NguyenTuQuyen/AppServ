require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received
    assert_equal "Order received", mail.subject
    assert_equal ["quyennt4562@gmail.com"], mail.to
    assert_equal ["vicedocthan@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
