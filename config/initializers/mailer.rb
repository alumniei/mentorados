Rails.application.config.action_mailer.delivery_method = :ses
Rails.application.config.action_mailer.default_url_options = { host: ENV.fetch("BASE_URL") }
