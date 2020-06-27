# frozen_string_literal: true

class InvitationsMailer < ApplicationMailer
  def confirmation
    @user = params[:user]
    @base_url = ENV.fetch('BASE_URL')
    @confirmation_url = invitation_url(@user.invitation_id)

    mail(to: @user.email, subject: default_i18n_subject)
  end
end
