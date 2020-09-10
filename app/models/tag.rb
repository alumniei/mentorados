# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :user_tags
  has_many :users, through: :user_tags

  def localized_name
    name["pt"]
  end
end
