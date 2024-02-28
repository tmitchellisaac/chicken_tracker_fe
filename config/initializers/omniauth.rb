Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['271838257306-2od0075jb8bepbd9cqo6tuo9q18etn4a.apps.googleusercontent.com'], ENV['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']
end
OmniAuth.config.allowed_request_methods = %i[get]