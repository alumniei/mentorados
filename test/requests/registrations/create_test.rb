# frozen_string_literal: true

require 'test_helper'

module RegistrationsController
  class CreateTest < ActionDispatch::IntegrationTest
    test 'missing parameters results in a bad request' do
      post registrations_path

      assert_response :bad_request
    end

    test 'good parameters result in a 201 created' do
      post registrations_path, params: { user: { email: 'student@fe.up.pt', password: 'bananas' } }

      assert_response :created
    end

    test 'good parameters create an unconfirmed user' do
      post registrations_path, params: { user: { email: 'student@fe.up.pt', password: 'bananas' } }

      assert_not_nil User.student.confirmation_pending.find_by(email: 'student@fe.up.pt')
    end

    test 'registering with a non feup email address results in a bad request' do
      post registrations_path, params: { user: { email: 'alice@example.org', password: 'bananas' } }

      assert_response :bad_request
    end
  end
end
