# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def confirm
    User.student.confirmation_pending.find_by!(registration_id: params[:id]).confirm!

    redirect_to '/'
  rescue ActiveRecord::RecordNotFound
    render :not_found, status: :not_found
  end

  def create
    @user = User.student.confirmation_pending.create(create_params)

    if @user.valid?
      @user.reload

      RegistrationsMailer.with(user: @user).confirmation.deliver_now!

      render status: :created
    else
      render :new, status: :bad_request
    end
  end

  def new
    @user = User.student.confirmation_pending.new
  end

  def show
    @user = User.student.confirmation_pending.find_by!(registration_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render :not_found, status: :not_found
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
