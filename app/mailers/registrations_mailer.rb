# frozen_string_literal: true

class RegistrationsMailer < ApplicationMailer
  def confirmation
    @user = params[:user]
    @base_url = ENV.fetch('BASE_URL')
    @confirmation_url = registration_url(@user.registration_id)

    mail(to: @user.email, subject: default_i18n_subject)
  end
end
