# frozen_string_literal: true

class PasswordRecovery < ApplicationRecord
  after_initialize :set_defaults
  attr_reader :verifier

  def set_defaults
    self.used = false if self.used.nil?
    self.expires_at = 24.hours.from_now.utc if self.expires_at.nil?
    self.selector = SecureRandom.urlsafe_base64(16) if self.selector.nil?
    self.verifier = SecureRandom.urlsafe_base64(16) if self.verifier_digest.nil?
  end

  def verifier=(value)
    @verifier = value
    if value.nil?
      self.verifier_digest = nil
    else
      self.verifier_digest = Digest::SHA256.hexdigest(value)
    end
  end

  def authenticate_verifier(value)
    ActiveSupport::SecurityUtils::secure_compare(
      Digest::SHA256.hexdigest(value),
      self.verifier_digest
    ) && self
  end

  def self.find_by_token(token)
    # Be careful when changing this to prevent
    # token discovery through timing attacks

    selector, verifier = token.split("~")

    non_existing_recovery = self.new

    recovery = self.find_by(selector: selector, used: false) || non_existing_recovery

    return unless Time.now.utc < recovery.expires_at
    return unless recovery.authenticate_verifier(verifier)

    recovery
  end
end
