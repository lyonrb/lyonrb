require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module Lyonrb
  class Application < Rails::Application
    # Autoload lib
    config.autoload_paths << 'lib'

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    # Enable IdentityMap for Active Record, to disable set to false or remove the line below.
    config.active_record.identity_map = true

    # Enable the asset pipeline
    config.assets.enabled = true
  end
end
