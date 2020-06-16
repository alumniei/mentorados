# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @session = Session.create(create_params)
    if @session.valid?
      session[:user_id] = @session.user_id

      redirect_to '/'
    else
      render :new, status: :bad_request
    end
  end

  def new
    @session = Session.new
  end

  private

  def create_params
    params.require(:session).permit(:email, :password)
  end
end
