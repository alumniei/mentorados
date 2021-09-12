class AccountRegistrationJob < ApplicationJob
  queue_as :default

  def perform(create_params)
    user = User.find_by(email: create_params[:email]) || User.student.confirmation_pending.create(create_params)
    if user.confirmed?
      RegistrationsMailer.with(user: user).already_registered.deliver_now
    else
      RegistrationsMailer.with(user: user).confirmation.deliver_now
    end
  end
end
