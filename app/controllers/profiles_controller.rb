# frozen_string_literal: true

class ProfilesController < ApplicationController
  def show
    authorize :profile
  end
end
