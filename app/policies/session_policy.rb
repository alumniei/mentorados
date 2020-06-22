# frozen_string_literal: true

SessionPolicy = Struct.new(:current_user, :record) do
  def create?
    current_user.nil?
  end

  def new?
    current_user.nil?
  end

  def destroy?
    current_user
  end
end
