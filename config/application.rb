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
  # time shit
  config.time_zone = 'Eastern Time (US & Canada)'
  config.datetime_format = '%l:%M %p on %B %e, %Y'

  # Uniqnames of DCO staff who can edit shit
  config.administrators = [:travigd, :victorbp]

  # Computers that can check stuff out
  # 1 represents the EECS office, 2 represents the BBB office
  config.checkout_computers = {
    '141.212.104.27' => 1, # eecs-dco-frontcomp1, in EECS
    '141.212.106.192' => 2 # dco-checkout-imac in BBB
  }

  # Cosign Stuff
  config.cosign_login_path = "https://weblogin.umich.edu/?cosign-sabine.eecs&https://sabine.eecs.umich.edu/"
  config.cosign_logout_path = "https://weblogin.umich.edu/cosign-bin/logout?https://sabine.eecs.umich.edu/"
  
  # use the routes defined to handle exceptions (HTTP 404, 500)
  config.exceptions_app = self.routes
end
