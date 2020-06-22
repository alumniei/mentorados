class DashboardsController < ApplicationController
  def show
    authorize :dashboard

    @mentors = User.mentor.order(updated_at: :desc)
    @students = User.student.order(created_at: :desc)
  end
end
