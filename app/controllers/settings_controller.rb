# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :load_settings, only: %i[edit update]

  def edit
    skip_authorization
  end

  def update
    skip_authorization

    @settings.save(params)

    redirect_to edit_settings_path
  end

  private

  def load_settings
    @settings = SettingsHelper::Settings.new(cookies)
  end
end
