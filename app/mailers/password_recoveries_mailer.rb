# frozen_string_literal: true

class PasswordRecoveriesMailer < ApplicationMailer
  after_action :prevent_delivery_to_non_existing_users

  def recovery
    @password = params[:password]
    @verifier = params[:verifier]
    @base_url = ENV.fetch('BASE_URL')
    @recovery_url = password_recovery_url("#{@password.selector}~#{@verifier}")

    mail(to: @password.email, subject: default_i18n_subject)
  end

  private

  def prevent_delivery_to_non_existing_users
    if User.find_by(email: @password.email).nil?
      mail.perform_deliveries = false
    end
  end
end
