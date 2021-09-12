# frozen_string_literal: true

Invitation = Struct.new(:email, :invited_by, keyword_init: true) do
  extend ActiveModel::Naming
  extend ActiveModel::Translation

  def self.create(args)
    new(**args).create
  end

  def create
    User.transaction do
      @user = User.create(
        email: email,
        invitation_id: SecureRandom.uuid,
        invited_at: Time.current,
        invited_by: invited_by,
        mentor: true,
        password: SecureRandom.alphanumeric(30),
      )

      if @user.valid?
        InvitationsMailer.with(user: @user).confirmation.deliver_now
      end
    end

    self
  end

  def valid?
    @user&.valid?
  end

  def persisted?
    @user&.persisted?
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
