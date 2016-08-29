require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "checkin_mail" do
    mail = ReservationMailer.checkin_mail
    assert_equal "Checkin mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
