require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "pano"

module TestApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += Dir[Rails.root.join("pano", "app", "models", "{*/}")]
  end
end
