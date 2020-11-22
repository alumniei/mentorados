# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  after_action :verify_authorized
  around_action :switch_locale
 
  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  rescue_from ActionController::ParameterMissing, with: :bad_request

  helper_method :current_user

  private

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = User.find_by(id: session[:user_id])
  end

  def bad_request
    head :bad_request
  end

  def unauthorized
    head :unauthorized
  end

  def switch_locale(&action)
    settings = SettingsHelper::Settings.new(cookies)
    locale = settings.language || I18n.default_locale

    I18n.with_locale(locale, &action)
  end
end
