# frozen_string_literal: true

class User < ApplicationRecord
  scope :confirmed, -> { where.not(confirmed_at: nil) }
  scope :confirmation_pending, -> { where(confirmed_at: nil) }
  scope :mentor, -> { where(mentor: true) }
  scope :student, -> { where(mentor: false) }

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_feup_email, on: :create, if: -> { student? }

  has_secure_password

  def confirmed?
    !confirmed_at.nil?
  end

  def student?
    !mentor
  end

  def mentor?
    mentor
  end

  def confirm!
    update(confirmed_at: Time.current)
  end

  private

  def validate_feup_email
    return if email.split('@').last.downcase == 'fe.up.pt'

    errors.add(:email, :feup_address_required)
  end
end
