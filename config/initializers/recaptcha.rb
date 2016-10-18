Recaptcha.configure do |config|
  config.public_key  = Rails.application.secrets.google_recaptcha_site_key
  config.private_key = Rails.application.secrets.google_recaptcha_secret_key
end
