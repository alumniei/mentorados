# frozen_string_literal: true

ProfilePolicy = Struct.new(:current_user, :record) do
  def show?
    current_user
  end
end
