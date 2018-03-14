require 'bourbon'
require 'haml'
require 'jquery-rails'
require 'turbolinks'
require 'webpacker'
require 'pano/version' # So the version number is available in the mounted style guide

module Pano
  class Engine < ::Rails::Engine
    isolate_namespace Pano

    initializer 'pano.assets.precompile' do |app|
      app.config.assets.precompile += %w(
        pano/guide.css
        pano/mailers.css
        pano/marketing.css

        pano/guide.js
      )
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
