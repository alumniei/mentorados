# frozen_string_literal: true

PasswordPolicy = Struct.new(:current_user, :record) do
  def new?
    current_user.nil?
  end

  def create?
    current_user.nil?
  end

  def show?
    current_user.nil?
  end
end
