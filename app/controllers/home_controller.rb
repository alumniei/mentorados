# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    skip_authorization
  end
end
