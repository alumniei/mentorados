# frozen_string_literal: true

class PasswordsController < ApplicationController
  def create
    authorize :password

    @password = Password.new(**create_params)

    if @password.save
      redirect_to '/'
    else
      render 'password_recoveries/show'
    end
  end

  private

  def create_params
    params.require(:password).permit(:token, :password)
  end
end
