# frozen_string_literal: true

class UserTag < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :tag
end
