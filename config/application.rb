require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.web_console.whitelisted_ips = ['172.19.0.1', '172.19.0.2', '172.19.0.3', '0.0.0.0/0', '::/0']
    config.api_only = true

        # Configuração da sessão
        config.session_store :cookie_store, key: '_spotify_auth_session'
        config.middleware.use ActionDispatch::Cookies
        config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
  end
end
