# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'students with fe.up.pt email addresses are allowed' do
    assert build(:user, :student, email: 'student@fe.up.pt').valid?
    assert build(:user, :student, email: 'STUDENT@FE.UP.PT').valid?
  end

  test 'students without an fe.up.pt email address are not allowed' do
    assert_not build(:user, :student, email: 'student@example.org').valid?
  end

  test 'mentors without an fe.up.pt email address are allowed' do
    assert build(:user, :mentor, email: 'mentor@example.org').valid?
  end

  test 'confirm! confirms user' do
    user = create(:user, :student)

    user.confirm!

    assert user.confirmed?
    assert_not_nil user.confirmed_at
  end

  test 'two users with the same email address in different cases are not allowed' do
    user = create(:user, :student)

    assert_not build(:user, :student, email: user.email.upcase).valid?
  end

  test 'user creation includes registration_id' do
    user = create(:user, :student)

    assert_not_nil user.registration_id
  end
end
