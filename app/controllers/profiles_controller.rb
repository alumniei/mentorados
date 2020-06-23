# frozen_string_literal: true

class ProfilesController < ApplicationController
  def edit
    authorize current_user
  end

  def update
    authorize current_user

    current_user.update(permitted_attributes(current_user))

    redirect_to edit_profile_path
  end
end
