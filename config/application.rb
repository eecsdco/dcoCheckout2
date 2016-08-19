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
  config.administrators = [:travigd, :victorbp, :laura, :don, :lrandolp, :kbanas, :hugh, :jvanlav, :liz, :dholt, :stander, :armruval, :mmgeorg, :swethar, :hayjacob]

  # Computers that can check stuff out
  # 1 represents the EECS office, 2 represents the BBB office
  config.checkout_computers = {
    '141.212.104.27' => 2, # eecs-dco-frontcomp1, in EECS
    '141.212.106.192' => 1, # dco-checkout-imac in BBB
    '67.198.16.148' => 1 # TODO remove this, it was for testing purposes
  }

  # Cosign Stuff
  config.cosign_login_path = "https://weblogin.umich.edu/?cosign-sabine.eecs&https://sabine.eecs.umich.edu/"
  config.cosign_logout_path = "https://weblogin.umich.edu/cosign-bin/logout?https://sabine.eecs.umich.edu/"
  
  # use the routes defined to handle exceptions (HTTP 404, 500)
  config.exceptions_app = self.routes

  config.action_mailer.delivery_method = :sendmail
  # Defaults to:
  # config.action_mailer.sendmail_settings = {
  # #   location: '/usr/sbin/sendmail',
  # #   arguments: '-i -t'
  # # }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = {from: 'no-reply@eecs.umich.edu'}
end
