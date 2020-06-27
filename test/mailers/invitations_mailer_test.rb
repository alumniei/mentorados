require 'test_helper'

class InvitationsMailerTest < ActionMailer::TestCase
  test "confirmation" do
    mail = InvitationsMailer.confirmation
    assert_equal "Confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
