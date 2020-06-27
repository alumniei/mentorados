# frozen_string_literal: true

class MentorsController < ApplicationController
  def index
    authorize :mentor

    @mentors = User.mentor.active.search(params[:query]).shuffle
  end
end
