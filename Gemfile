source 'https://rubygems.org'

gem 'rails', '~>3.2'

gem 'rack', '~>1.4'

# Database module
gem 'origin', '~>1.0.11'
gem 'moped', '~>1.4.3'
gem "mongoid", '~>3.1.2'

# For convenient styling macros and SASS
gem 'compass-rails', '~> 1.0'
gem 'blueprint-rails', '~> 0.2'

# To interpret Coffeescript in HAML
gem 'coffee-filter', '~> 0.1'

# JavaScript library
gem 'jquery-rails', '~> 2.2'

# Enable HAML format views. Prettier than ERB format views.
gem "haml", '~> 3.1'

# For deployment. Phusion Passenger integrates the rails app. with Apache.
gem 'passenger', '~>4.0'

# To manage background processes
gem 'god'

# Poker logic
gem 'acpc_dealer', git: 'https://github.com/builderworksco/acpc_dealer'
gem 'acpc_poker_player_proxy', '~> 1.1'

# Improved forms
gem 'simple_form'

# Instant form validation
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'client_side_validations-mongoid'

# Improved logging output
gem 'awesome_print'

# Simple exception email notifications
gem 'rusen'

# For CLI client application
gem 'methadone'

# For better errors in WAPP
gem 'contextual_exceptions'

# To run background process
gem 'process_runner'

# For background process communication
gem 'sidekiq'

# To add bots without restarting the server
gem 'require_reloader'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  # JavaScript library
  gem 'jquery-ui-rails'

  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem "bootstrap-sass-rails"
  gem 'zen-grids'

  # compass uses this for sprites
  gem 'chunky_png'

  # native c library for png routines to speed up chunky_png
  gem 'oily_png'
end

group :development do
  # YARD documentation library
  gem 'yard'

  # To interpret markdown
  gem 'kramdown'

  # gem 'rack-mini-profiler'

  # Better error information
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

  # Not strictly necessary but makes
  # testing through a VM network much faster
  # because WeBrick needs a line of configuration
  # changed, otherwise it's impossibly slow 
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'mocha', require: false
  gem 'rspec-rails-mocha', require: false
end

gem 'foreman'
gem 'devise'
gem 'devise_invitable'
gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.3.4'
