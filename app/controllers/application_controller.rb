# frozen_string_literal: true

class ApplicationController < ActionController::Base
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
end
