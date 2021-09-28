# frozen_string_literal: true

class RegistrationsController < ApplicationController
  def confirm
    authorize :registration

    User.student.confirmation_pending.find_by!(registration_id: params[:id]).confirm!

    redirect_to '/'
  rescue ActiveRecord::RecordNotFound
    render :not_found, status: :not_found
  end

  def create
    authorize :registration

    AccountRegistrationJob.perform_later create_params

    render status: :created
  end

  def new
    authorize :registration

    @user = User.student.confirmation_pending.new
  end

  def show
    authorize :registration

    @user = User.student.confirmation_pending.find_by!(registration_id: params[:id])
  rescue ActiveRecord::RecordNotFound
    render :not_found, status: :not_found
  end

  private

  def create_params
    params.require(:user).permit(:email, :password)
  end
end
