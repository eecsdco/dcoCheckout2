require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DcoCheckout
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Rails.application.configure do
  config.administrators = [:travigd, :victorbp]
  config.cosign_login_path = "https://weblogin.umich.edu/?cosign-sabine.eecs&https://sabine.eecs.umich.edu/"
  config.cosign_logout_path = "https://weblogin.umich.edu/cosign-bin/logout?https://sabine.eecs.umich.edu/"
  config.exceptions_app = self.routes
end
