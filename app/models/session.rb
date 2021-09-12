# frozen_string_literal: true

Session = Struct.new(:email, :password, keyword_init: true) do
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  def self.i18n_scope
    "activerecord"
  end

  def self.create(args)
    new(**args).authenticate
  end

  def authenticate
    # Be careful when changing this to prevent
    # account enumeration through timing attacks

    non_existing_user = User.new(password: SecureRandom.hex(32))

    @user = User.confirmed.find_by(email: email) || non_existing_user
    @valid = @user.authenticate(password)

    self
  end

  def valid?
    @valid
  end

  def persisted?
    false
  end

  def user_id
    @user.id
  end

  def errors
    errors = ActiveModel::Errors.new(self)
    errors.add(:base, :invalid_credentials) if !valid?
    errors
  end
end
