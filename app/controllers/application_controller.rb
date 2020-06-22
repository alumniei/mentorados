# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  rescue_from ActionController::ParameterMissing, with: :bad_request

  helper_method :current_user

  private

  def current_user
    return @user if defined?(@user)

    @user = User.find_by(id: session[:user_id])
  end

  def bad_request
    head :bad_request
  end

  def unauthorized
    head :unauthorized
  end
end
