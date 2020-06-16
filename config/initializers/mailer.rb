if Rails.env.test? == false
  Rails.application.config.action_mailer.delivery_method = :ses
end

Rails.application.config.action_mailer.default_url_options = { host: ENV.fetch("BASE_URL") }
