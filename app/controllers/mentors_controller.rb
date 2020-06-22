# frozen_string_literal: true

class MentorsController < ApplicationController
  def index
    authorize :mentor

    @mentors = User.mentor.active.shuffle
  end
end
