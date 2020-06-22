# frozen_string_literal: true

DashboardPolicy = Struct.new(:current_user, :record) do
  def show?
    current_user.admin?
  end
end
