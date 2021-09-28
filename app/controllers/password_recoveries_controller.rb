# frozen_string_literal: true

class PasswordRecoveriesController < ApplicationController
  def new
    authorize :password

    @password = PasswordRecovery.new
  end

  def create
    authorize :password

    # Be careful when changing this to prevent
    # account enumeration through timing attacks

    @password = PasswordRecovery.create!(create_params)
    PasswordRecoveriesMailer
      .with(password: @password, verifier: @password.verifier)
      .recovery
      .deliver_later

    render status: :created
  end

  def show
    authorize :password

    @password = Password.new(token: params[:id])
  end

  private

  def create_params
    params.require(:password_recovery).permit(:email)
  end
end
