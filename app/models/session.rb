# frozen_string_literal: true

Session = Struct.new(:email, :password, keyword_init: true) do
  extend ActiveModel::Naming

  def self.create(args)
    new(**args).authenticate
  end

  def authenticate
    @user = User.confirmed.find_by(email: email)
    @valid = @user&.authenticate(password)

    self
  end

  def valid?
    @valid
  end

  def persisted?
    false
  end

  def user_id
    @user&.id
  end

  def errors
    if @user
      @user.errors
    else
      ActiveModel::Errors.new(self)
    end
  end
end
