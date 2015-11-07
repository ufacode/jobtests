Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.full_host = 'http://localhost:3000/'
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
