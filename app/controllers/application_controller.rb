# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActionController::ParameterMissing, with: :bad_request

  private

  def bad_request
    head :bad_request
  end
end
