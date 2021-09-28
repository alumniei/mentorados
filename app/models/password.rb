# frozen_string_literal: true

Password = Struct.new(:token, :password, keyword_init: true) do
  extend ActiveModel::Naming

  def self.create(args)
    new(**args).save
  end

  def save
    return false if !valid?

    User.transaction do
      user.update(password: password) && password_recovery.update(used: true)
    end
  end

  def password_recovery
    return @password_recovery if defined?(@password_recovery)

    @password_recovery = PasswordRecovery.find_by_token(token)
  end

  def user
    return @user if defined?(@user)

    @user = password_recovery&.then { |pr| User.find_by(email: pr.email) }
  end

  def valid?
    return @valid if defined?(@valid)

    @valid = password_recovery != nil
  end

  def persisted?
    false
  end

  def errors
    if user
      user.errors
    else
      ActiveModel::Errors.new(self)
    end
  end
end
