# frozen_string_literal: true

class SettingsController < ApplicationController
  def edit
    skip_authorization
  end

  def update
    skip_authorization

    settings.save(params)

    redirect_to edit_settings_path
  end
end
