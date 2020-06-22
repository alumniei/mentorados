# frozen_string_literal: true

MentorPolicy = Struct.new(:current_user, :record) do
  def index?
    current_user
  end
end
