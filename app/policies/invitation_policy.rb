# frozen_string_literal: true

InvitationPolicy = Struct.new(:current_user, :record) do
  def confirm?
    true
  end

  def create?
    current_user&.admin?
  end

  def new?
    current_user&.admin?
  end

  def show?
    true
  end
end
