# frozen_string_literal: true

RegistrationPolicy = Struct.new(:current_user, :record) do
  def confirm?
    current_user.nil?
  end

  def create?
    current_user.nil?
  end

  def new?
    current_user.nil?
  end

  def destroy?
    current_user
  end

  def show?
    current_user.nil?
  end
end
