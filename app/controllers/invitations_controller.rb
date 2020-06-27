# frozen_string_literal: true

class InvitationsController < ApplicationController
  def confirm
    authorize :invitation

    @user = User.mentor.confirmation_pending.find_by!(invitation_id: params[:id])

    if @user.update(confirm_params)
      @user.confirm!

      session[:user_id] = @user.id

      redirect_to edit_profile_path
    else
      render :show, status: :bad_request
    end
  end

  def create
    authorize :invitation

    @invitation = Invitation.create(create_params.merge(invited_by: current_user))
    if @invitation.valid?
      redirect_to dashboard_path
    else
      render :new, status: :bad_request
    end
  end

  def new
    @invitation = Invitation.new
    authorize :invitation
  end

  def show
    authorize :invitation

    @user = User.mentor.confirmation_pending.find_by!(invitation_id: params[:id])
  end

  private

  def create_params
    params.require(:invitation).permit(:email)
  end

  def confirm_params
    params.require(:user).permit(:password)
  end
end
