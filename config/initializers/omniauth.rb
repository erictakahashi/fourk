OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '257135874448990', 'e899e4dbc6392f164fec61c02eb50686'
end