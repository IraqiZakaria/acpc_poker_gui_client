# Load the rails application
require File.expand_path('../application', __FILE__)

require 'yaml'
YAML::ENGINE.yamler= 'syck'

# Initialize the rails application
AcpcPokerGuiClient::Application.initialize!
AcpcPokerGuiClient::Application.configure do
  config.action_mailer.default_url_options = { host: 'localhost:3000',
                                               from: 'CMU Poker <no-reply@example.com>',
                                               reply_to: 'CMU Poker <no-reply@example.com>'
  }
  config.action_mailer.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
      address:        'smtp.mandrillapp.com',
      port:           587,
      domain:         'example.com',
      user_name:      ENV['CMU_MANDRILL_USER_ID'],
      password:       ENV['CMU_MANDRILL_USER_PASSWORD'],
      authentication: 'plain',
      enable_starttls_auto: true
  }
end
